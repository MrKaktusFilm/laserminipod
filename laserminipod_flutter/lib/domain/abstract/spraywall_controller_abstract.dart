import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';

abstract class SprayWallControllerAbstract extends ChangeNotifier {
  void addHandle(int id);

  void removeHandle(int id);

  void clearCurrentRoute();

  void saveCurrentRoute(String name);

  void deleteRoute(int id);

  void loadRoute(SpraywallRoute route);

  SpraywallRoute getCurrentRoute();

  bool isHandleActivated(int id);

  bool existsCurrentRouteAlready();

  bool nameAlreadyAssigned(String name);
}
