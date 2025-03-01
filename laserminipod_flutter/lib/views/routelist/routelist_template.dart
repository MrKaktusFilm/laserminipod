import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/views/routelist/routelist_tile.dart';

class RouteListTemplate extends StatefulWidget {
  const RouteListTemplate(
      {super.key, required this.navigateToSpraywall, required this.loadRoutes});

  final VoidCallback navigateToSpraywall;
  final Function() loadRoutes;

  @override
  State<RouteListTemplate> createState() => _RouteListTemplateState();
}

class _RouteListTemplateState extends State<RouteListTemplate> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RouteControllerAbstract>(
        builder: (context, spraywallContoller, child) {
      return FutureBuilder<List<SpraywallRoute>>(
        future: widget.loadRoutes(),
        builder: (context, AsyncSnapshot<List<SpraywallRoute>> snapshot) {
          List<SpraywallRoute>? routes = [];
          if (snapshot.hasData) {
            routes = snapshot.data;
            return ListView.builder(
                itemCount: routes?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: RoutelistTile(
                    route: routes![index],
                  ));
                });
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const SizedBox.shrink();
        },
      );
    });
  }
}
