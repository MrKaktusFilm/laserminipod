import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';

class RoutelistTile extends StatefulWidget {
  const RoutelistTile(
      {super.key, required this.route, required this.navigateToSpraywall});

  final SpraywallRoute route;
  final VoidCallback navigateToSpraywall;

  @override
  State<RoutelistTile> createState() => _RoutelistTileState();
}

class _RoutelistTileState extends State<RoutelistTile> {
  void onTap() {
    Provider.of<SprayWallControllerAbstract>(context, listen: false)
        .displayRoute(widget.route);
    widget.navigateToSpraywall();
  }

  void onDelete() {
    Provider.of<RouteControllerAbstract>(context, listen: false)
        .openDeleteRouteDialog(widget.route.id!);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.route.name),
      onTap: onTap,
      trailing: IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
    );
  }
}
