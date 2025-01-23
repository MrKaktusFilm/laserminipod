import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:user_app/data/handle_model.dart';
import 'package:user_app/data/route_model.dart';
import 'package:user_app/domain/spraywall_controller.dart';
import 'package:user_app/home.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// global variables
late Client client;
late SessionManager sessionManager;
EmailAuthController authController = EmailAuthController(client.modules.auth);
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  client = Client(
    'http://10.0.2.2:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  await sessionManager.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var routeModel = RouteModel();
    var handleModel = HandleModel();
    return AppState(
      title: 'DIE Laser App die laser ist',
      spraywallController:
          SpraywallController(routeModel: routeModel, handleModel: handleModel),
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        home: const HomePage(),
      ),
    );
  }
}
