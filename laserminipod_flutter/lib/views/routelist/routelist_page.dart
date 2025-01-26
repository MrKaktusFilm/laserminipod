import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
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
    return Consumer<SprayWallControllerAbstract>(
        builder: (context, spraywallContoller, child) {
      return FutureBuilder<List<SpraywallRoute>>(
        future: spraywallContoller.loadAllRoutes(),
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
                    navigateToSpraywall: widget.navigateToSpraywall,
                  ));
                });
          } else if (spraywallContoller.isLoading()) {
            return const Align(child: CircularProgressIndicator());
          }
          return const Placeholder();
        },
      );
    });
  }
}
