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
    sessionManager.signOutDevice();
    notifyListeners();
  }
}
