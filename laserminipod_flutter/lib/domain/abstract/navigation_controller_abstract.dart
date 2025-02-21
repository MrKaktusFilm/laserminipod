import 'package:flutter/material.dart';
import 'package:user_app/routes.dart';

abstract class NavigationControllerAbstract extends ChangeNotifier {
  int get currentPageIndex;

  void setPageIndex(int index);

  void closeCurrentScreen(BuildContext context);

  void pushPage(BuildContext context, AppRoute page);

  void switchToHandleManagementEdit(BuildContext context);

  void switchToHandleManagementOverview(BuildContext context);
}
