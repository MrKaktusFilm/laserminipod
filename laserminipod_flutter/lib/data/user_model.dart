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
}
