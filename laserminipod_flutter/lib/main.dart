import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/route_model.dart';
import 'package:user_app/domain/routelist_controller.dart';
import 'package:user_app/domain/spraywall_controller.dart';
import 'package:user_app/home.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var routeModel = RouteModelTest();
    return AppState(
      title: 'DIE Laser App die laser ist',
      spraywallController: SpraywallController(routeModel: routeModel),
      routelistController: RoutelistController(routeModel: routeModel),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
