import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:user_app/data/database/server_connection.dart';
import 'package:user_app/data/database/server_connection_model_abstract.dart';

class ServerConnectionModel implements ServerConnectionModelAbstract {
  Database? _db;

  @override
  Future<void> initialize() async {
    // Avoid errors caused by flutter upgrade.
    WidgetsFlutterBinding.ensureInitialized();

    String path = join(await getDatabasesPath(), "server_connections.db");
    _db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE connections (
        serverUrl TEXT PRIMARY KEY,
        name TEXT,
        active INTEGER
      )
    ''');
  }

  @override
  Future<ServerConnection?> getActiveConnection() async {
    var connectionMaps =
        await _db!.rawQuery('SELECT * FROM connections WHERE active = 1');
    // max one connection should be active at a time
    var connections = _mapToConnections(connectionMaps);
    return connections.isNotEmpty ? connections.first : null;
  }

  @override
  Future<List<ServerConnection>> getAllConnections() async {
    var connectionMaps = await _db!.rawQuery('SELECT * FROM connections');
    return _mapToConnections(connectionMaps);
  }

  @override
  Future<void> insertConnection(ServerConnection connection) async {
    await _db!.insert(
      'connections',
      connection.toMap(),
    );
  }

  @override
  Future<void> updateConnection(ServerConnection connection) async {
    await _db!.update(
      'connections',
      connection.toMap(),
      where: 'serverUrl = ?',
      whereArgs: [connection.serverUrl],
    );
  }

  List<ServerConnection> _mapToConnections(
      List<Map<String, dynamic>> connectionMaps) {
    return connectionMaps.map((connectionMap) {
      return ServerConnection(
        connectionMap['serverUrl'] as String,
        connectionMap['name'] as String,
        (connectionMap['active'] as int) == 1,
      );
    }).toList();
  }

  @override
  Future<ServerConnection?> getConnection(String serverUrl) async {
    var connectionMaps = await _db!
        .rawQuery('SELECT * FROM connections WHERE serverUrl = ?', [serverUrl]);
    var connections = _mapToConnections(connectionMaps);
    return connections.isNotEmpty ? connections.first : null;
  }
}
