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

  @override
  void closeCurrentScreen(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void openPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
