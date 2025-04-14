import 'package:flutter/material.dart';
import 'package:user_app/data/database/server_connection.dart';

abstract interface class ServerConnectionControllerAbstract
    extends ChangeNotifier {
  Future<List<ServerConnection>> getAllConnections();

  /// inserts connection into db if doesn't exists already
  Future<void> saveConnection(ServerConnection connection);

  Future<String?> getActiveConnectionUrl();

  Future<void> deactivateActiveConnection();
}
