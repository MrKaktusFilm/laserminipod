import 'package:flutter/material.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/views/dialogs/login_dialog.dart';
import 'package:user_app/views/routelist/routelist_page.dart';
import 'package:user_app/views/spraywall/spraywall_page.dart';

class AppState extends InheritedWidget {
  final String title;
  final SprayWallControllerAbstract spraywallController;

  const AppState(
      {super.key,
      required this.title,
      required this.spraywallController,
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title!,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Spraywall',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_sharp),
            label: 'Routes',
          ),
          NavigationDestination(
            icon: Icon(Icons.front_hand_sharp),
            label: 'Handles',
          ),
        ],
      ),
      body: <Widget>[
        Container(
            color: const Color.fromRGBO(76, 175, 80, 1),
            child: const SpraywallPage()),
        ListenableBuilder(
            listenable: AppState.of(context)!.spraywallController,
            builder: (context, _) {
              return RouteListPage(
                navigateToSpraywall: navigateToSpraywall,
              );
            }),
        const AdminLoginScreen()
      ][currentPageIndex],
    );
  }
}
