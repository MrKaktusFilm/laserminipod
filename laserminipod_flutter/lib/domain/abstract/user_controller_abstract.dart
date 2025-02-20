import 'package:flutter/material.dart';

abstract class UserControllerAbstract extends ChangeNotifier {
  bool isSignedIn();

  void logOut();

  /// returns error message for failed login
  Future<String?> logIn(String email, String password, BuildContext context);

  Future<String?> changePasswordIfValid(String oldPassword, String newPassword);

  String? validatePasswordRequirements(String? value);

  String? validateNewPasswordRequirements(String? value);

  bool isValidEmail(String email);
}
