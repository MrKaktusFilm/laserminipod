import 'package:flutter/material.dart';
import 'package:user_app/data/database/server_connection.dart';
import 'package:user_app/data/database/server_connection_model_abstract.dart';
import 'package:user_app/domain/abstract/server_connection_controller_abstract.dart';

class ServerConnectionController extends ChangeNotifier
    implements ServerConnectionControllerAbstract {
  final ServerConnectionModelAbstract _serverConnectionModel;

  List<ServerConnection> _connections = [];

  ServerConnectionController(
      {required ServerConnectionModelAbstract serverConnectionModel})
      : _serverConnectionModel = serverConnectionModel;

  @override
  Future<void> deactivateActiveConnection() async {
    final connection = await _serverConnectionModel.getActiveConnection();
    if (connection != null) {
      connection.active = false;
      await _serverConnectionModel.updateConnection(connection);
    }
  }

  @override
  Future<String?> getActiveConnectionUrl() async {
    final connection = await _serverConnectionModel.getActiveConnection();
    return connection?.serverUrl;
  }

  @override
  Future<List<ServerConnection>> getAllConnections() async {
    _connections = await _serverConnectionModel.getAllConnections();
    return _connections;
  }

  @override
  Future<void> saveConnection(ServerConnection connection) async {
    var existingConnection =
        await _serverConnectionModel.getConnection(connection.serverUrl);
    if (existingConnection != null) {
      return await _serverConnectionModel.updateConnection(connection);
    } else {
      return await _serverConnectionModel.insertConnection(connection);
    }
  }
}
