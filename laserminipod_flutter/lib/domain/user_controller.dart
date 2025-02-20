import 'package:flutter/material.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/main.dart';

class UserController extends ChangeNotifier implements UserControllerAbstract {
  final NavigationControllerAbstract _navigationController;

  UserController({required NavigationControllerAbstract navigationController})
      : _navigationController = navigationController;

  @override
  bool isSignedIn() {
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
    return _validatePasswordRequirements(value, false);
  }

  @override
  String? validateNewPasswordRequirements(String? value) {
    return _validatePasswordRequirements(value, true);
  }

  String? _validatePasswordRequirements(String? value, bool newPassword) {
    var loc = UiHelper.getAppLocalization();
    if (value == null || value.isEmpty) {
      return newPassword ? loc.enterNewPassword : loc.enterPassword;
    }
    if (value.length < 8) {
      return loc.passwordLengthError;
    }
    return null;
  }

  @override
  bool isValidEmail(String email) {
    // Regulärer Ausdruck für eine valide E-Mail-Adresse
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&\*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );

    return emailRegex.hasMatch(email);
  }
}
