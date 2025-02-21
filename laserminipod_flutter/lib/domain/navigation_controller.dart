import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/routes.dart';

class NavigationController extends ChangeNotifier
    implements NavigationControllerAbstract {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  @override
  void setPageIndex(int index) {
    if (index != _currentPageIndex) {
      _currentPageIndex = index;
      notifyListeners();
    }
  }

  @override
  void closeCurrentScreen(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void pushPage(BuildContext context, AppRoute page) {
    GoRouter.of(context).go(page.fullPath);
  }

  @override
  void switchToHandleManagementEdit(BuildContext context) {
    pushPage(context, AppRoute.handleManagementEdit);
  }

  @override
  void switchToHandleManagementOverview(BuildContext context) {
    pushPage(context, AppRoute.handleManagementOverview);
  }
}
