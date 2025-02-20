abstract class UserModelAbstract {
  Future<void> changePassword(String email, String newPassword);

  Future<bool> checkPassword(String email, String password);

  Future<void> createUser(String email, String userName, String password);
}
