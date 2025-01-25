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
            userIdentifier: '0',
            created: DateTime.now(),
            scopeNames: ['authenticated']);
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
}
