import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/home.dart';
import 'package:user_app/views/routelist/routelist_tile.dart';

class RouteListPage extends StatefulWidget {
  const RouteListPage({super.key, required this.navigateToSpraywall});

  final VoidCallback navigateToSpraywall;

  @override
  State<RouteListPage> createState() => _RouteListPageState();
}

class _RouteListPageState extends State<RouteListPage> {
  bool hasErrorOccured = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SpraywallRoute>>(
      future: AppState.of(context)?.spraywallController.loadAllRoutes(),
      builder: (context, AsyncSnapshot<List<SpraywallRoute>> snapshot) {
        if (snapshot.hasError) {
          hasErrorOccured = true;
          scheduleMicrotask(() {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Text("There was an error loading the routes.")));
          });
        }

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
        } else if (!hasErrorOccured) {
          return const Align(child: CircularProgressIndicator());
        }
        // is shown if error occurs
        return const Placeholder();
      },
    );
  }
}
