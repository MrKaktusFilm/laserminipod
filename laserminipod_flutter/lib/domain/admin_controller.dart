import 'package:flutter/material.dart';
import 'package:user_app/domain/abstract/admin_controller_abstract.dart';
import 'package:user_app/main.dart';

class AdminController extends ChangeNotifier
    implements AdminControllerAbstract {
  @override
  bool hasAdminAccess() {
    return sessionManager.isSignedIn;
  }

  @override
  void logOut() {
    // TODO: navigate to home ; error handling
    sessionManager.signOutDevice();
    notifyListeners();
  }

  @override
  Future<String?> logIn(String email, String password) async {
    try {
      var result = await authController.signIn(
        email.trim(),
        password.trim(),
      );
      return result != null ? null : 'Invalid login credentials';
    } catch (e) {
      return 'Login failed: ${e.toString()}';
    } finally {
      notifyListeners();
    }
  }
}
