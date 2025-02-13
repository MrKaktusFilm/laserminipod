import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/handle_model_abstract.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';

class SpraywallController extends ChangeNotifier
    implements SprayWallControllerAbstract {
  final RouteModelAbstract routeModel;
  final HandleModelAbstract handleModel;

  SpraywallRoute currentRoute =
      SpraywallRoute(handles: <int>[], id: 0, name: "");

  SpraywallController({required this.handleModel, required this.routeModel});

  @override
  bool toggleHandle(int id) {
    if (currentRoute.handles.contains(id)) {
      currentRoute.handles.remove(id);
      notifyListeners();
      return false;
    } else {
      currentRoute.handles.add(id);
      notifyListeners();
      return true;
    }
  }

  @override
  void clearCurrentRoute() {
    currentRoute.handles = [];
    notifyListeners();
  }

  /// loads the given route to the spraywall screen panel
  @override
  void displayRoute(SpraywallRoute route) {
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
}
