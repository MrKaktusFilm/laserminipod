import 'package:flutter/material.dart';

abstract class NavigationControllerAbstract extends ChangeNotifier {
  int get currentPageIndex;

  void setPageIndex(int index);
}
