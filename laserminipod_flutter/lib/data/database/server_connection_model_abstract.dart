import 'package:user_app/data/database/server_connection.dart';

abstract interface class ServerConnectionModelAbstract {
  Future<void> initialize();

  Future<ServerConnection?> getConnection(String serverUrl);

  Future<List<ServerConnection>> getAllConnections();

  Future<ServerConnection?> getActiveConnection();

  Future<void> updateConnection(ServerConnection connection);

  Future<void> insertConnection(ServerConnection connection);
}
