import 'package:flutter/material.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';

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
}
