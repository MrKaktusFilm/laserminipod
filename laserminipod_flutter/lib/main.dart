import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/route_model.dart';
import 'package:user_app/domain/spraywall_controller.dart';
import 'package:user_app/home.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// global variables
var client = Client('http://10.0.2.2:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var routeModel = RouteModel();
    return AppState(
      title: 'DIE Laser App die laser ist',
      spraywallController: SpraywallController(routeModel: routeModel),
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        home: const HomePage(),
      ),
    );
  }
}
