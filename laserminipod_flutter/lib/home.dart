import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/appbar.dart';
import 'package:user_app/domain/abstract/admin_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/views/admin/administration_page.dart';
import 'package:user_app/views/routelist/routelist_page.dart';
import 'package:user_app/views/spraywall/spraywall_page.dart';

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
    var title = "Laser App";

    return Scaffold(
      appBar: HomeAppBar(title: title),
      bottomNavigationBar:
          Consumer2<AdminControllerAbstract, NavigationControllerAbstract>(
        builder: (context, adminController, navigationController, child) {
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
      ),
      body: Consumer<NavigationControllerAbstract>(
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
