import 'package:flutter/material.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/views/admin/handle_management_edit_page.dart';
import 'package:user_app/views/admin/handle_management_overview_page.dart';

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

  @override
  void switchToHandleManagementEdit(BuildContext context,
      {TransformationController? startTransformation, int? selectedHandle}) {
    closeCurrentScreen(context);
    openPage(
        context,
        HandleManagementEditPage(
          startTransformation: startTransformation,
          selectedHandle: selectedHandle,
        ));
  }

  @override
  void switchToHandleManagementOverview(BuildContext context,
      {TransformationController? startTransformation}) {
    closeCurrentScreen(context);
    openPage(context, HandleManagementOverviewPage());
  }
}
