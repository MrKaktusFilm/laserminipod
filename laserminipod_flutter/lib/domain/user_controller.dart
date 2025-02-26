import 'package:flutter/material.dart';
import 'package:user_app/data/abstract/user_model_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/main.dart';
import 'package:user_app/routes.dart';

class UserController extends ChangeNotifier implements UserControllerAbstract {
  final UserModelAbstract _userModel;
  final NavigationControllerAbstract _navigationController;

  UserController(
      {required NavigationControllerAbstract navigationController,
      required UserModelAbstract userModel})
      : _navigationController = navigationController,
        _userModel = userModel;

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
      BuildContext context, String oldPassword, String newPassword) async {
    try {
      String email = sessionManager.signedInUser!.email!;
      bool isOldPasswordValid =
          await _userModel.checkPassword(email, oldPassword);
      if (isOldPasswordValid) {
        await _userModel.changePassword(email, newPassword);
        UiHelper.showSnackbar(
            UiHelper.getAppLocalization().passwordChanged, Colors.green);
        if (context.mounted) {
          _navigationController.closeCurrentScreen(context);
        }
      } else {
        return UiHelper.getAppLocalization().invalidLogin;
      }
    } catch (e) {
      return UiHelper.getAppLocalization().passwordChangeError;
    }
    return null;
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

  @override
  Future<String?> createUser(BuildContext context, String userName,
      String email, String password) async {
    try {
      await _userModel.createUser(email, userName, password);
      for (var i = 0; i < 2; i++) {
        if (context.mounted) {
          _navigationController.closeCurrentScreen(context);
          logIn(email, password, context);
        }
      }
    } on Exception {
      var loc = UiHelper.getAppLocalization();
      return loc.createUserError;
    }
    return null;
  }

  @override
  bool hasAdminRights() {
    if (!sessionManager.isSignedIn) {
      return false;
    }
    return sessionManager.signedInUser!.scopeNames.contains(Scopes.admin.name);
  }

  @override
  Future<void> deleteUser() async {
    // TODO: Admin check (nicht löschbar)
    try {
      await _userModel.deleteUser(sessionManager.signedInUser!.email!);
      logOut();
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().deleteUserError, e);
    }
  }

  @override
  int? getSignedInUserId() {
    return sessionManager.signedInUser!.id;
  }
}
