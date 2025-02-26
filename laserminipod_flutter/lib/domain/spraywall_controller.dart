import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/handle_model_abstract.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
import 'package:user_app/data/abstract/spraywall_model_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';

class SpraywallController extends ChangeNotifier
    implements SprayWallControllerAbstract {
  final RouteModelAbstract routeModel;
  final HandleModelAbstract handleModel;
  final SpraywallModelAbstract spraywallModel;

  List<int> currentRoute = [];

  SpraywallController(
      {required this.handleModel,
      required this.routeModel,
      required this.spraywallModel});

  @override
  bool toggleHandle(int id) {
    spraywallModel.toggleHandle(id);
    if (currentRoute.contains(id)) {
      currentRoute.remove(id);
      notifyListeners();
      return false;
    } else {
      currentRoute.add(id);
      notifyListeners();
      return true;
    }
  }

  @override
  void clearCurrentRoute() {
    spraywallModel.clearCurrentRoute();
    currentRoute = [];
    notifyListeners();
  }

  /// loads the given route to the spraywall screen panel
  @override
  void displayRoute(SpraywallRoute route) {
    spraywallModel.loadRoute(route);
    // TODO: copy (auch im Service)
    currentRoute = route.handles;
    notifyListeners();
  }

  @override
  List<int> getCurrentRoute() {
    // TODO: Klasse für HandleMap bauen
    return currentRoute;
  }

  @override
  bool isHandleActivated(int id) {
    return currentRoute.contains(id);
  }
}
