import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/views/routelist/all_routes_tab.dart';

class RouteListPage extends StatefulWidget {
  final Widget child;

  const RouteListPage({super.key, required this.child});

  @override
  State<RouteListPage> createState() => _RouteListPageState();
}

class _RouteListPageState extends State<RouteListPage> {
  @override
  Widget build(BuildContext context) {
    final loc = UiHelper.getAppLocalization();
    final userController =
        Provider.of<UserControllerAbstract>(context, listen: false);
    final routeController =
        Provider.of<RouteControllerAbstract>(context, listen: false);
    Widget content;

    if (!userController.isSignedIn()) {
      // only show allRoutes tab for guests
      content = AllRoutesTab();
    } else {
      content = DefaultTabController(
          length: 3,
          initialIndex: routeController.routeListTabIndex,
          child: Column(
            children: [
              TabBar(
                onTap: (index) {
                  routeController.setTabIndex(context, index);
                },
                tabs: [
                  Tab(icon: Icon(Icons.flag), text: loc.myProjects),
                  Tab(icon: Icon(Icons.route), text: loc.myRoutes),
                  Tab(icon: Icon(Icons.terrain), text: loc.allRoutes),
                ],
              ),
              Expanded(child: widget.child)
            ],
          ));
    }

    return FutureBuilder(
        future: routeController.loadRouteInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return content;
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
