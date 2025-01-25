import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/appbar.dart';
import 'package:user_app/domain/abstract/admin_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/navigation_controller.dart';
import 'package:user_app/views/admin/administration_page.dart';
import 'package:user_app/views/routelist/routelist_page.dart';
import 'package:user_app/views/spraywall/spraywall_page.dart';

class AppState extends InheritedWidget {
  final String title;
  final SprayWallControllerAbstract spraywallController;
  final AdminControllerAbstract adminController;

  const AppState(
      {super.key,
      required this.title,
      required this.spraywallController,
      required this.adminController,
      required super.child});

  static AppState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(AppState oldWidget) {
    //return oldWidget.routeController.getCurrentRoute() ==
    //    routeController.getCurrentRoute();
    return true;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  void navigateToSpraywall() {
    setState(() {
      currentPageIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var title = AppState.of(context)?.title;
    var adminController = AppState.of(context)?.adminController;

    return Scaffold(
      appBar: HomeAppBar(title: title!),
      bottomNavigationBar: ListenableBuilder(
        listenable: adminController!,
        builder: (context, _) {
          return Consumer<NavigationController>(
            builder: (context, navigationController, child) {
              return NavigationBar(
                onDestinationSelected: (int index) {
                  navigationController.setPageIndex(index);
                },
                indicatorColor: Colors.amber,
                selectedIndex: navigationController.currentPageIndex,
                destinations: <Widget>[
                  const NavigationDestination(
                    selectedIcon: Icon(Icons.home),
                    icon: Icon(Icons.home_outlined),
                    label: 'Spraywall',
                  ),
                  const NavigationDestination(
                    icon: Icon(Icons.list_sharp),
                    label: 'Routes',
                  ),
                  if (adminController.hasAdminAccess())
                    const NavigationDestination(
                      icon: Icon(Icons.settings),
                      label: 'Administration',
                    ),
                ],
              );
            },
          );
        },
      ),
      body: Consumer<NavigationController>(
        builder: (context, navigationController, child) {
          final pages = [
            const SpraywallPage(),
            RouteListPage(
              navigateToSpraywall: () => navigationController.setPageIndex(0),
            ),
            AdministrationPage(),
          ];
          return pages[navigationController.currentPageIndex];
        },
      ),
    );
  }
}
