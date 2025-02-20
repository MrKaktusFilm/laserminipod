import 'package:laserminipod_server/src/di.dart';
import 'package:laserminipod_server/src/domain/user_service.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserEndpoint extends Endpoint {
  final UserService _userService = getIt<UserService>();

  Future<void> changePassword(
      Session session, String email, String newPassword) async {
    await _userService.changePassword(session, email, newPassword);
  }

  Future<bool> checkPassword(
      Session session, String email, String password) async {
    return await _userService.checkPassword(session, email, password);
  }

  Future<UserInfo?> createUser(
      Session session, String email, String userName, String password) async {
    return await _userService.createUser(session, email, userName, password);
  }
}
