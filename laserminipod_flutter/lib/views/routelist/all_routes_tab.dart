import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/views/routelist/routelist_template.dart';

class AllRoutesTab extends StatefulWidget {
  const AllRoutesTab({super.key});

  @override
  State<AllRoutesTab> createState() => _AllRoutesTabState();
}

class _AllRoutesTabState extends State<AllRoutesTab> {
  @override
  Widget build(BuildContext context) {
    final routeController =
        Provider.of<RouteControllerAbstract>(context, listen: false);

    return RouteListTemplate(getRoutes: routeController.getAllRoutes);
  }
}
