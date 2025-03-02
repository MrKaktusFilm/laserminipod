import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laserminipod_client/laserminipod_client.dart';

abstract class RouteControllerAbstract extends ChangeNotifier {
  void saveCurrentRoute(String? description, int difficulty);

  void deleteRoute(int id);

  Future<bool> existsCurrentRouteAlready();

  Future<bool> nameAlreadyAssigned(String name);

  void updateNameStatus(String input);

  void openSaveRouteDialog();

  void openDeleteRouteDialog(int routeID);

  String? validateRouteName(String? input);

  Future<bool> loadAllRoutes();

  List<SpraywallRoute> getAllRoutes();

  List<SpraywallRoute> getMyRoutes();

  void setTabIndex(BuildContext context, int index);

  String? tabRedirect(BuildContext context, GoRouterState state);

  String? get nameErrorMessage;

  bool get isLoading;

  int get routeListTabIndex;
}
