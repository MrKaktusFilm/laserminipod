import 'package:flutter/material.dart';

abstract class AdminControllerAbstract extends ChangeNotifier {
  bool hasAdminAccess();

  void logOut();

  /// returns error message for failed login
  Future<String?> logIn(String email, String password);
}
