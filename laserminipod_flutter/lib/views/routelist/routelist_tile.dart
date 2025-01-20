import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/home.dart';

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
    AppState.of(context)!.spraywallController.displayRoute(widget.route);
    widget.navigateToSpraywall();
  }

  void onDelete() {
    AppState.of(context)!
        .spraywallController
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
