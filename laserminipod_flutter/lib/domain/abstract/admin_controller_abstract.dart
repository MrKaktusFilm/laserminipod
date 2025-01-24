import 'package:flutter/material.dart';

abstract class AdminControllerAbstract extends ChangeNotifier {
  bool hasAdminAccess();

  void logOut();
}
