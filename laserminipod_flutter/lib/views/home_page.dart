import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/views/appbar.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final loc = UiHelper.getAppLocalization();

    return Scaffold(
      appBar: HomeAppBar(),
      bottomNavigationBar:
          Consumer2<UserControllerAbstract, NavigationControllerAbstract>(
        builder: (context, adminController, navigationController, child) {
          return NavigationBar(
            onDestinationSelected: (int index) {
              navigationController.setPageIndex(context, index);
            },
            indicatorColor: Colors.amber,
            selectedIndex: navigationController.currentPageIndex,
            destinations: <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: loc.spraywallTitle,
              ),
              NavigationDestination(
                icon: Icon(Icons.list_sharp),
                label: loc.routeListTitle,
              ),
              if (adminController.hasAdminRights())
                NavigationDestination(
                  icon: Icon(Icons.settings),
                  label: loc.administrationTitle,
                ),
            ],
          );
        },
      ),
      body: Consumer<NavigationControllerAbstract>(
        builder: (context, navigationController, child) {
          return widget.child;
        },
      ),
    );
  }
}
