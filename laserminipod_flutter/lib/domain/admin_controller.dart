import 'package:flutter/material.dart';
import 'package:user_app/domain/abstract/admin_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/main.dart';

class AdminController extends ChangeNotifier
    implements AdminControllerAbstract {
  final NavigationControllerAbstract navigationController;

  AdminController({required this.navigationController});

  @override
  bool hasAdminAccess() {
    return sessionManager.isSignedIn;
  }

  @override
  Future<void> logOut() async {
    // TODO: navigate to home ; error handling
    try {
      await sessionManager.signOutDevice();
      // if user is currently on administration page, navigate to home
      if (navigationController.currentPageIndex == 2) {
        navigationController.setPageIndex(0);
      }
    } on Exception {
      UiHelper.showErrorSnackbar("Es gab einen Fehler beim ausloggen");
    }
    notifyListeners();
  }

  @override
  Future<String?> logIn(
      String email, String password, BuildContext context) async {
    try {
      var result = await authController.signIn(
        email.trim(),
        password.trim(),
      );
      if (result != null) {
        if (context.mounted) {
          Navigator.pop(context);
        }
        return null;
      } else {
        return "Invalid login credentials";
      }
    } catch (e) {
      return 'Login failed: ${e.toString()}';
    } finally {
      notifyListeners();
    }
  }
}
