import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:user_app/data/abstract/handle_model_abstract.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
import 'package:user_app/data/handle_model.dart';
import 'package:user_app/data/route_model.dart';
import 'package:user_app/domain/abstract/admin_controller_abstract.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/domain/abstract/image_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/admin_controller.dart';
import 'package:user_app/domain/handle_controller.dart';
import 'package:user_app/domain/image_controller.dart';
import 'package:user_app/domain/navigation_controller.dart';
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

  // data models
  HandleModelAbstract handleModel = HandleModel();
  RouteModelAbstract routeModel = RouteModel();

  // controller
  NavigationControllerAbstract navigationController = NavigationController();
  SprayWallControllerAbstract sprayWallController =
      SpraywallController(handleModel: handleModel, routeModel: routeModel);
  AdminControllerAbstract adminController =
      AdminController(navigationController: navigationController);
  HandleControllerAbstract handleController = HandleController(
      handleModel: handleModel, navigationController: navigationController);
  ImageControllerAbstract imageController = ImageController();
  await imageController.loadImageDimensions();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationControllerAbstract>(
            create: (_) => navigationController),
        ChangeNotifierProvider<SprayWallControllerAbstract>(
            create: (_) => sprayWallController),
        ChangeNotifierProvider<AdminControllerAbstract>(
            create: (_) => adminController),
        ChangeNotifierProvider<HandleControllerAbstract>(
            create: (_) => handleController),
        ChangeNotifierProvider<ImageControllerAbstract>(
            create: (_) => imageController),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}
