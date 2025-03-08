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

  Future<auth.UserInfo?> getUserByUsername(
      Session session, String username) async {
    var users = await auth.UserInfo.db.find(
      session,
      where: (t) => t.userName.equals(username),
    );
    return users.isNotEmpty ? users.first : null;
  }

  Future<auth.UserInfo?> createUser(
      Session session, auth.UserInfo userInfo, String hash) async {
    var userInfoDB = await auth.Users.createUser(session, userInfo);

    if (userInfoDB!.id != null) {
      var emailAuth = auth.EmailAuth(
        email: userInfo.email!,
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

  Future<void> deleteUser(Session session, String email) async {
    var user = await getUserByEmail(session, email);
    if (user != null) {
      await auth.EmailAuth.db.deleteRow(session, user);
      await auth.UserInfo.db
          .deleteWhere(session, where: (t) => t.id.equals(user.userId));
    }
  }

  Future<auth.UserInfo?> getUserById(Session session, int id) async {
    var users = await auth.UserInfo.db.find(
      session,
      where: (t) => t.id.equals(id),
    );
    return users.isNotEmpty ? users.first : null;
  }
}
