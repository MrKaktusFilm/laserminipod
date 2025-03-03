import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
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
    return Consumer<RouteControllerAbstract>(
        builder: (context, spraywallContoller, child) {
      final routes = widget.getRoutes();
      return ListView.builder(
          itemCount: routes?.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: RoutelistTile(
              route: routes![index],
            ));
          });
    });
  }
}
