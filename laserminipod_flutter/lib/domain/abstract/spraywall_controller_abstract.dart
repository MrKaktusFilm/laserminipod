import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';

abstract class SprayWallControllerAbstract extends ChangeNotifier {
  void addHandle(int id);

  void removeHandle(int id);

  void clearCurrentRoute();

  void saveCurrentRoute();

  void deleteRoute(int id);

  void loadRoute(SpraywallRoute route);

  SpraywallRoute getCurrentRoute();

  bool isHandleActivated(int id);

  Future<bool> existsCurrentRouteAlready();

  Future<bool> nameAlreadyAssigned(String name);

  void updateNameStatus(String input);

  void openSaveRouteDialog();

  void openDeleteRouteDialog(int routeID);

  String? validateRouteName(String? input);

  Future<List<SpraywallRoute>> loadAllRoutes();

  bool isLoading();

  String? get nameErrorMessage;
}
