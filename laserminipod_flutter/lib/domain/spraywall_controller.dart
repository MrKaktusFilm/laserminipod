import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/route_model_test_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';

class SpraywallController extends ChangeNotifier
    implements SprayWallControllerAbstract {
  final RouteModelTestAbstract routeModel;

  SpraywallRoute currentRoute =
      SpraywallRoute(handles: <int>[], id: 0, name: "");

  SpraywallController({required this.routeModel});

  @override
  void addHandle(int id) {
    currentRoute.handles.add(id);
    notifyListeners();
  }

  @override
  void removeHandle(int id) {
    currentRoute.handles.remove(id);
    notifyListeners();
  }

  @override
  void clearCurrentRoute() {
    currentRoute.handles = [];
    notifyListeners();
  }

  @override
  void saveCurrentRoute(String name) {
    if (!routeModel.existsRouteAlready(currentRoute)) {
      currentRoute.name = name;
      routeModel.saveRoute(currentRoute);
      notifyListeners();
    }
  }

  @override
  void deleteRoute(int id) {
    routeModel.deleteRoute(id);
    notifyListeners();
  }

  @override
  void loadRoute(SpraywallRoute route) {
    currentRoute = route.copyWith();
    notifyListeners();
  }

  @override
  SpraywallRoute getCurrentRoute() {
    return currentRoute;
  }

  @override
  bool isHandleActivated(int id) {
    return currentRoute.handles.contains(id);
  }

  @override
  bool existsCurrentRouteAlready() {
    return routeModel.existsRouteAlready(currentRoute);
  }

  @override
  bool nameAlreadyAssigned(String name) {
    return routeModel.nameAlreadyAssigned(name);
  }
}
