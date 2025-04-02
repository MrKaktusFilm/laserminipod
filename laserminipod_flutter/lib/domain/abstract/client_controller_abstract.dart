import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

abstract class ClientControllerAbstract extends ChangeNotifier {
  Client get client;
  SessionManager get sessionManager;
  EmailAuthController get authController;

  Future<void> initializeClient(String serverUrl);

  Future<void> loadSession();
}
