import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:user_app/data/network/abstract/user_model_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/routes.dart';

class UserController extends ChangeNotifier implements UserControllerAbstract {
  final UserModelAbstract _userModel;
  final NavigationControllerAbstract _navigationController;
  SessionManager? _sessionManager; // Make nullable
  EmailAuthController? _authController; // Make nullable

  List<UserInfo> _users = [];

  UserController(
      {required NavigationControllerAbstract navigationController,
      required UserModelAbstract userModel})
      : _navigationController = navigationController,
        _userModel = userModel;

  @override
  bool isSignedIn() {
    return _sessionManager?.isSignedIn ?? false; // Add null check
  }

  @override
  Future<void> logOut() async {
    try {
      await _sessionManager!.signOutDevice();
      if (_navigationController.currentPageIndex == 2) {
        _navigationController.goToPage(AppRoute.home);
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
      var result = await _authController!.signIn(
        email.trim(),
        password.trim(),
      );
      if (result != null) {
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
      String email = _sessionManager!.signedInUser!.email!;
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
    // TODO: email is case sensitive
    var loc = UiHelper.getAppLocalization();
    try {
      await _userModel.createUser(email, userName, password);
      try {
        var result = await _authController!.signIn(
          email.trim(),
          password.trim(),
        );

        if (result == null) {
          return UiHelper.getAppLocalization().invalidLogin;
        }
      } catch (e) {
        return UiHelper.getAppLocalization().loginFailed;
      } finally {
        notifyListeners();
      }
    } on CreateUserException catch (e) {
      if (e.message.contains("email")) {
        return loc.emailTaken;
      }
      if (e.message.contains("username")) {
        return loc.userNameTaken;
      }
    } on Exception {
      return loc.createUserError;
    }
    return null;
  }

  @override
  bool hasAdminRights() {
    if (!_sessionManager!.isSignedIn) {
      return false;
    }
    return _sessionManager!.signedInUser!.scopeNames
        .contains(Scopes.admin.name);
  }

  @override
  Future<void> deleteUser() async {
    // admins should not be deletable
    if (hasAdminRights()) return;
    try {
      await _userModel.deleteUser(_sessionManager!.signedInUser!.email!);
      logOut();
      _navigationController.goToPage(AppRoute.home);
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().deleteUserError, e);
    }
  }

  @override
  int? getSignedInUserId() {
    return _sessionManager!.signedInUser!.id;
  }

  /// exception handling in view
  @override
  Future<UserInfo?> getUserById(int id) async {
    UserInfo? user = await _userModel.getUserById(id);
    return user;
  }

  @override
  Future<bool> loadAllUsers() async {
    try {
      _users = await _userModel.getAllUsers();
    } catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().error, e as Exception);
      _users = [];
    }
    return true;
  }

  @override
  List<UserInfo> get users => _users;

  @override
  String? getSignedInEmail() {
    if (isSignedIn()) {
      return _sessionManager!.signedInUser!.email;
    }
    return null;
  }

  @override
  String? getSignedInUserName() {
    if (isSignedIn()) {
      return _sessionManager!.signedInUser!.userName;
    }
    return null;
  }

  @override
  Future<void> setUserName(String newUserName) async {
    await _userModel.setUserName(getSignedInUserId()!, newUserName);
    // update username in current session
    _sessionManager!.signedInUser!.userName = newUserName;
    notifyListeners();
  }

  @override
  Future<String?> resetPassword(
      String verificationCode, String email, String newPassword) async {
    String? errorMessage;
    try {
      errorMessage = !(await _authController!
              .resetPassword(email, verificationCode, newPassword))
          ? UiHelper.getAppLocalization().resetInvalidCode
          : null;
    } on Exception {
      errorMessage = UiHelper.getAppLocalization().resetPasswordError;
    }
    return errorMessage;
  }

  @override
  Future<String?> sendPasswordResetValidationCode(String email) async {
    var loc = UiHelper.getAppLocalization();
    bool showErrorMessage = false;
    try {
      showErrorMessage = !(await _authController!.initiatePasswordReset(email));
    } catch (e) {
      showErrorMessage = true;
    }
    if (!showErrorMessage) {
      UiHelper.showSnackbar(
          '${loc.emailSent} $email', Colors.green); // Localized text
    }
    return showErrorMessage
        ? loc.emailError // Localized text
        : null;
  }

  @override
  void initialize(
      EmailAuthController authController, SessionManager sessionManager) {
    _sessionManager = sessionManager;
    _authController = authController;
    notifyListeners();
  }
}
