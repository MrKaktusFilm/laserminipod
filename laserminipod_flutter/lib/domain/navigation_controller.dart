import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/main.dart';
import 'package:user_app/routes.dart';

class NavigationController extends ChangeNotifier
    implements NavigationControllerAbstract {
  int _currentPageIndex = 0;

  @override
  int get currentPageIndex => _currentPageIndex;

  @override
  void setPageIndex(BuildContext context, int index) {
    if (index != _currentPageIndex) {
      switch (index) {
        case 0:
          goToPage(AppRoute.home);
          break;
        case 1:
          goToPage(AppRoute.myprojects);
          break;
        case 2:
          goToPage(AppRoute.administration);
          break;
      }

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
    GoRouter.of(context).push(page.fullPath);
  }

  @override
  void goToPage(AppRoute page) {
    switch (page) {
      case AppRoute.home:
        _currentPageIndex = 0;
        break;
      case AppRoute.myprojects || AppRoute.myroutes || AppRoute.allroutes:
        _currentPageIndex = 1;
        break;
      case AppRoute.administration:
        _currentPageIndex = 2;
        break;
      default:
    }
    navigatorKey.currentContext?.go(page.fullPath);
  }
}
