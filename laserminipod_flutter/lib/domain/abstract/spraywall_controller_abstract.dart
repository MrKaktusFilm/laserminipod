import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';

abstract class SprayWallControllerAbstract extends ChangeNotifier {
  /// return new activation state of given handle
  bool toggleHandle(int id);

  void clearCurrentRoute();

  void saveCurrentRoute();

  void deleteRoute(int id);

  void displayRoute(SpraywallRoute route);

  SpraywallRoute getCurrentRoute();

  bool isHandleActivated(int id);

  Future<bool> existsCurrentRouteAlready();

  Future<bool> nameAlreadyAssigned(String name);

  void updateNameStatus(String input);

  void openSaveRouteDialog();

  void openDeleteRouteDialog(int routeID);

  String? validateRouteName(String? input);

  Future<List<SpraywallRoute>> loadAllRoutes();

  Future<List<Handle>> loadAllHandles();

  bool isLoading();

  String? get nameErrorMessage;

  Future<(int, int)> getImageDimensions(String path);
}
