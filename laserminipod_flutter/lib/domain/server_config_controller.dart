import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:user_app/domain/abstract/server_config_controller_abstract.dart';

class ServerConfigController
    with ChangeNotifier
    implements ServerConfigControllerAbstract {
  static const String _key = 'server_url';
  String? _serverUrl;

  @override
  String? get serverUrl => _serverUrl;

  @override
  Future<void> loadServerUrl() async {
    final prefs = await SharedPreferences.getInstance();
    _serverUrl = prefs.getString(_key);
    notifyListeners();
  }

  @override
  Future<void> setServerUrl(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, url);
    _serverUrl = url;
    notifyListeners();
  }
}
