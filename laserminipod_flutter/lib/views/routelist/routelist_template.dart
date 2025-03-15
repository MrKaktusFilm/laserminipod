import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/filter_controller_abstract.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/views/routelist/routelist_tile.dart';

class RouteListTemplate extends StatefulWidget {
  const RouteListTemplate({super.key, required this.getRoutes});

  final Function() getRoutes;

  @override
  State<RouteListTemplate> createState() => _RouteListTemplateState();
}

class _RouteListTemplateState extends State<RouteListTemplate> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<RouteControllerAbstract, FilterControllerAbstract>(
        builder: (context, spraywallContoller, filterController, child) {
      final routes = widget.getRoutes();
      if (routes == null || routes.isEmpty) {
        return Center(
          child: Text(
            UiHelper.getAppLocalization().emptyRouteList,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        );
      }
      return ListView.builder(
        itemCount: routes.length,
        itemBuilder: (BuildContext context, int index) {
          return RoutelistTile(
            route: routes[index],
          );
        },
      );
    });
  }
}
