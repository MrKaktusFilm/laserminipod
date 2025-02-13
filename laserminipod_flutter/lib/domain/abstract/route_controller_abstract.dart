import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';

abstract class RouteControllerAbstract extends ChangeNotifier {
  void saveCurrentRoute();

  void deleteRoute(int id);

  Future<bool> existsCurrentRouteAlready();

  Future<bool> nameAlreadyAssigned(String name);

  void updateNameStatus(String input);

  void openSaveRouteDialog();

  void openDeleteRouteDialog(int routeID);

  String? validateRouteName(String? input);

  Future<List<SpraywallRoute>> loadAllRoutes();

  String? get nameErrorMessage;
}
