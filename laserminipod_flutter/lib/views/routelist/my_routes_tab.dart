import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/views/routelist/routelist_template.dart';

class MyRoutesTab extends StatelessWidget {
  const MyRoutesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final routeController =
        Provider.of<RouteControllerAbstract>(context, listen: false);

    return RouteListTemplate(getRoutes: routeController.getMyRoutes);
  }
}
