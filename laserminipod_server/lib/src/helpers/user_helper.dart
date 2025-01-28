import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

class UserHelper {
  static Future<void> createUser(
      Session session, String email, String password) async {
    try {
      var hashedPassword = await auth.defaultGeneratePasswordHash(password);
      // Check if the admin user already exists
      var existingUser = await auth.EmailAuth.db.find(session);

      if (existingUser.isEmpty) {
        var userInfo = auth.UserInfo(
            blocked: false,
            userIdentifier: email,
            created: DateTime.now(),
            scopeNames: []);
        var userInfoDB = await auth.UserInfo.db.insertRow(session, userInfo);
        await auth.EmailAuth.db.insert(session, [
          auth.EmailAuth(
              email: email, userId: userInfoDB.id!, hash: hashedPassword)
        ]);
        session.log('User created: $email');
      } else {
        session.log('User already exists: $email');
      }
    } catch (e) {
      session.log('Error ensuring admin user exists: $e',
          level: LogLevel.error);
    }
  }

  static Future<void> changePassword(
      Session session, String email, String newPassword) async {
    try {
      var existingUser = await auth.EmailAuth.db.find(
        session,
        where: (t) => t.email.equals(email),
      );

      if (existingUser.length == 1) {
        var newHashedPassword =
            await auth.defaultGeneratePasswordHash(newPassword);

        existingUser[0].hash = newHashedPassword;
        await auth.EmailAuth.db.updateRow(session, existingUser[0]);

        session.log('Password successfully changed for: $email');
      } else {
        session.log('User not found: $email', level: LogLevel.warning);
      }
    } catch (e, stackTrace) {
      session.log(
        'Error changing password for $email: $e\n$stackTrace',
        level: LogLevel.error,
      );
    }
  }

  static Future<bool> checkPassword(
      Session session, String email, String password) async {
    try {
      var existingUser = await auth.EmailAuth.db.find(
        session,
        where: (t) => t.email.equals(email),
      );

      if (existingUser.length == 1) {
        var isPasswordValid = await auth.defaultValidatePasswordHash(
          password,
          email,
          existingUser[0].hash,
        );

        return isPasswordValid;
      } else {
        session.log('User not found: $email', level: LogLevel.warning);
        return false;
      }
    } catch (e, stackTrace) {
      session.log(
        'Error checking password for $email: $e\n$stackTrace',
        level: LogLevel.error,
      );
      return false;
    }
  }
}
