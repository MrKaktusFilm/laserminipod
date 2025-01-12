import 'package:flutter/material.dart';
import 'package:user_app/common/entities/route.dart';
import 'package:user_app/home.dart';
import 'package:user_app/views/dialogs/delete_route_dialog.dart';

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
    AppState.of(context)!.spraywallController.loadRoute(widget.route);
    widget.navigateToSpraywall();
  }

  void onDelete() {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            DeleteRouteDialog(id: widget.route.id));
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
