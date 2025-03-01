import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';

class RouteListPage extends StatefulWidget {
  final Widget child;

  const RouteListPage({super.key, required this.child});

  @override
  State<RouteListPage> createState() => _RouteListPageState();
}

class _RouteListPageState extends State<RouteListPage> {
  late final RouteControllerAbstract _routeController;

  @override
  Future<void> didChangeDependencies() async {
    _routeController =
        Provider.of<RouteControllerAbstract>(context, listen: false);
    await _routeController.loadAllRoutes();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: _routeController.routeListTabIndex,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                _routeController.setTabIndex(context, index);
              },
              tabs: [
                Tab(icon: Icon(Icons.home), text: "Home"),
                Tab(icon: Icon(Icons.person), text: "Profile"),
                Tab(icon: Icon(Icons.settings), text: "Settings"),
              ],
            ),
            widget.child
          ],
        ));
  }
}
