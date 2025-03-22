import 'package:flutter/material.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

abstract class UserControllerAbstract extends ChangeNotifier {
  bool isSignedIn();

  bool hasAdminRights();

  void logOut();

  /// returns error message for failed login
  Future<String?> logIn(String email, String password, BuildContext context);

  Future<String?> changePasswordIfValid(
      BuildContext context, String oldPassword, String newPassword);

  Future<String?> createUser(
      BuildContext context, String userName, String email, String password);

  Future<void> deleteUser();

  String? validatePasswordRequirements(String? value);

  String? validateNewPasswordRequirements(String? value);

  bool isValidEmail(String email);

  int? getSignedInUserId();

  String? getSignedInUserName();

  String? getSignedInEmail();

  Future<UserInfo?> getUserById(int id);

  Future<bool> loadAllUsers();

  List<UserInfo> get users;

  Future<void> setUserName(String newUserName);

  Future<String?> resetPassword(
      String verificationCode, String email, String newPassword);

  Future<String?> sendPasswordResetValidationCode(String email);
}
