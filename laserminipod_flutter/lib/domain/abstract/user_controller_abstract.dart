import 'package:flutter/material.dart';

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

  String? validatePasswordRequirements(String? value);

  String? validateNewPasswordRequirements(String? value);

  bool isValidEmail(String email);
}
