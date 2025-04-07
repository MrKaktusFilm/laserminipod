import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:user_app/data/abstract/handle_model_abstract.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
import 'package:user_app/data/abstract/spraywall_model_abstract.dart';
import 'package:user_app/data/abstract/user_model_abstract.dart';
import 'package:user_app/domain/abstract/client_controller_abstract.dart';
import 'package:user_app/domain/abstract/image_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';

class ClientController extends ChangeNotifier
    implements ClientControllerAbstract {
  final HandleModelAbstract handleModel;
  final UserModelAbstract userModel;
  final SpraywallModelAbstract spraywallModel;
  final RouteModelAbstract routeModel;
  final UserControllerAbstract userController;
  final ImageControllerAbstract imageController;

  late Client _client;
  late SessionManager _sessionManager;
  late EmailAuthController _authController;
  bool _isLoading = false;

  ClientController(
      {required this.imageController,
      required this.handleModel,
      required this.userModel,
      required this.spraywallModel,
      required this.routeModel,
      required this.userController});

  @override
  Client get client => _client;
  @override
  SessionManager get sessionManager => _sessionManager;
  @override
  EmailAuthController get authController => _authController;
  @override
  bool get isLoading => _isLoading;

  @override
  Future<void> initializeClient(String serverUrl) async {
    _isLoading = true;
    notifyListeners();
    try {
      _client = Client(serverUrl,
          authenticationKeyManager: FlutterAuthenticationKeyManager())
        ..connectivityMonitor = FlutterConnectivityMonitor();

      await _client.health.isConnectionSuccessful();

      _sessionManager = SessionManager(caller: _client.modules.auth);
      _authController = EmailAuthController(client.modules.auth);

      await _initializeComponents(client);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  Future<void> loadSession() async {
    await _sessionManager.initialize();
    notifyListeners();
  }

  Future<void> _initializeComponents(Client client) async {
    routeModel.initialize(client);
    handleModel.initialize(client);
    userModel.initialize(client);
    spraywallModel.initialize(client);

    userController.initialize(authController, sessionManager);
    await imageController.loadImageDimensions();
  }
}
