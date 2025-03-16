import 'package:serverpod_auth_client/serverpod_auth_client.dart';

abstract class UserModelAbstract {
  Future<void> changePassword(String email, String newPassword);

  Future<bool> checkPassword(String email, String password);

  Future<void> createUser(String email, String userName, String password);

  Future<void> deleteUser(String email);

  Future<UserInfo?> getUserById(int id);

  Future<List<UserInfo>> getAllUsers();

  Future<void> setUserName(int userId, String newUserName);
}
