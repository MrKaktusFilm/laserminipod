import 'package:flutter/material.dart';
import 'package:user_app/domain/abstract/admin_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/main.dart';

class AdminController extends ChangeNotifier
    implements AdminControllerAbstract {
  final NavigationControllerAbstract _navigationController;

  AdminController({required NavigationControllerAbstract navigationController})
      : _navigationController = navigationController;

  @override
  bool hasAdminAccess() {
    return sessionManager.isSignedIn;
  }

  @override
  Future<void> logOut() async {
    try {
      await sessionManager.signOutDevice();
      if (_navigationController.currentPageIndex == 2) {
        _navigationController.setPageIndex(0);
      }
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar(UiHelper.getAppLocalization().logoutError, e);
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
        return UiHelper.getAppLocalization().invalidLogin;
      }
    } catch (e) {
      return UiHelper.getAppLocalization().loginFailed;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<String?> changePasswordIfValid(
      String oldPassword, String newPassword) async {
    try {
      String email = sessionManager.signedInUser!.email!;
      bool isOldPasswordValid =
          await client.user.checkPassword(email, oldPassword);
      if (isOldPasswordValid) {
        bool success = await client.user.changePassword(email, newPassword);
        if (success) {
          UiHelper.showSnackbar(
              UiHelper.getAppLocalization().passwordChanged, Colors.green);
          return null;
        } else {
          return UiHelper.getAppLocalization().passwordChangeError;
        }
      } else {
        return UiHelper.getAppLocalization().invalidLogin;
      }
    } catch (e) {
      return UiHelper.getAppLocalization().passwordChangeError;
    }
  }

  @override
  String? validatePasswordRequirements(String? value) {
    if (value == null || value.isEmpty) {
      return UiHelper.getAppLocalization().enterNewPassword;
    }
    if (value.length < 8) {
      return UiHelper.getAppLocalization().passwordLengthError;
    }
    return null;
  }
}
