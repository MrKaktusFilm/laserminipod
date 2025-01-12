import 'package:flutter/material.dart';
import 'package:user_app/common/entities/route.dart';
import 'package:user_app/home.dart';
import 'package:user_app/views/routelist/routelist_tile.dart';

class RouteListPage extends StatefulWidget {
  const RouteListPage({super.key, required this.navigateToSpraywall});

  final VoidCallback navigateToSpraywall;

  @override
  State<RouteListPage> createState() => _RouteListPageState();
}

class _RouteListPageState extends State<RouteListPage> {
  @override
  Widget build(BuildContext context) {
    var routes = getAllRoutes();

    return ListView.builder(
        itemCount: routes?.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: RoutelistTile(
            route: routes![index],
            navigateToSpraywall: widget.navigateToSpraywall,
          ));
        });
  }

  List<SpraywallRoute>? getAllRoutes() {
    return AppState.of(context)?.routelistController.loadAllRoutes();
  }
}
