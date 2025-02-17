import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

class UserRepository {
  Future<auth.EmailAuth?> getUserByEmail(Session session, String email) async {
    var users = await auth.EmailAuth.db.find(
      session,
      where: (t) => t.email.equals(email),
    );
    return users.isNotEmpty ? users.first : null;
  }

  Future<auth.UserInfo?> createUser(
      Session session, String email, String hash) async {
    var userInfo = auth.UserInfo(
      blocked: false,
      userIdentifier: email,
      created: DateTime.now(),
      scopeNames: [],
    );
    var userInfoDB = await auth.UserInfo.db.insertRow(session, userInfo);

    if (userInfoDB.id != null) {
      var emailAuth = auth.EmailAuth(
        email: email,
        userId: userInfoDB.id!,
        hash: hash,
      );
      await auth.EmailAuth.db.insert(session, [emailAuth]);
      return userInfoDB;
    }
    return null;
  }

  Future<void> updatePasswordHash(
      Session session, String email, String newHash) async {
    var user = await getUserByEmail(session, email);
    if (user != null) {
      user.hash = newHash;
      await auth.EmailAuth.db.updateRow(session, user);
    }
  }
}
