import 'package:flutter/material.dart';

abstract class ServerConfigControllerAbstract extends ChangeNotifier {
  String? get serverUrl;

  Future<void> loadServerUrl();

  Future<void> setServerUrl(String url);
}
