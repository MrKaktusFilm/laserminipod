import 'package:serverpod_auth_client/src/protocol/user_info.dart';
import 'package:user_app/data/abstract/user_model_abstract.dart';
import 'package:user_app/main.dart';

class UserModel implements UserModelAbstract {
  var userEndpoint = client.user;

  @override
  Future<void> changePassword(String email, String newPassword) async {
    await userEndpoint.changePassword(email, newPassword);
  }

  @override
  Future<bool> checkPassword(String email, String password) async {
    return await userEndpoint.checkPassword(email, password);
  }

  @override
  Future<void> createUser(
      String email, String userName, String password) async {
    await userEndpoint.createUser(email, userName, password);
  }

  @override
  Future<void> deleteUser(String email) async {
    await userEndpoint.deleteUser(email);
  }

  @override
  Future<UserInfo?> getUserById(int id) async {
    return await userEndpoint.getUserById(id);
  }
}
