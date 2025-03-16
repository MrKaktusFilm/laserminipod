import 'package:laserminipod_server/src/di.dart';
import 'package:laserminipod_server/src/domain/user_service.dart';
import 'package:laserminipod_server/src/extensions/endpoint_ext.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserEndpoint extends Endpoint {
  final UserService _userService = getIt<UserService>();

  Future<void> changePassword(
      Session session, String email, String newPassword) async {
    await validateUserScope(session);
    await _userService.changePassword(session, email, newPassword);
  }

  Future<bool> checkPassword(
      Session session, String email, String password) async {
    await validateUserScope(session);
    return await _userService.checkPassword(session, email, password);
  }

  Future<UserInfo?> createUser(
      Session session, String email, String userName, String password) async {
    return await _userService.createUser(session, email, userName, password);
  }

  Future<void> deleteUser(Session session, String email) async {
    await validateUserScope(session);
    await _userService.deleteUser(session, email);
  }

  Future<UserInfo?> getUserById(Session session, int id) async {
    return await _userService.getUserById(session, id);
  }

  Future<List<UserInfo>> getAllUsers(Session session) async {
    return await _userService.getAllUsers(session);
  }

  Future<void> setUserName(
      Session session, int userId, String newUserName) async {
    await validateUserScope(session);
    return await _userService.setUserName(session, userId, newUserName);
  }
}
