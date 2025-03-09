import 'package:flutter/material.dart';
import 'package:user_app/common/enums/handle_state_enum.dart';
import 'package:user_app/data/abstract/handle_model_abstract.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
import 'package:user_app/data/abstract/spraywall_model_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';

class SpraywallController extends ChangeNotifier
    implements SprayWallControllerAbstract {
  final RouteModelAbstract routeModel;
  final HandleModelAbstract handleModel;
  final SpraywallModelAbstract spraywallModel;

  Map<int, HandleStateEnum> currentRoute = {};

  SpraywallController(
      {required this.handleModel,
      required this.routeModel,
      required this.spraywallModel});

  @override
  HandleStateEnum toggleHandle(int id) {
    HandleStateEnum? newState;
    if (currentRoute.containsKey(id)) {
      currentRoute[id] = currentRoute[id]!.increase();
      if (currentRoute[id] == HandleStateEnum.deactivated) {
        currentRoute.remove(id);
        newState = HandleStateEnum.deactivated;
      } else {
        newState = currentRoute[id]!;
      }
    } else {
      currentRoute[id] = HandleStateEnum.normal;
      newState = HandleStateEnum.normal;
    }
    // fire and forget
    spraywallModel.toggleHandle(id, newState.value);
    notifyListeners();
    return newState;
  }

  @override
  void clearCurrentRoute() {
    spraywallModel.clearCurrentRoute();
    currentRoute = {};
    notifyListeners();
  }

  /// loads the given route to the spraywall screen panel
  @override
  void displayRoute(Map<int, HandleStateEnum> route) {
    Map<int, int> routeIntMap = {};
    route.forEach((id, state) => routeIntMap[id] = state.value);
    spraywallModel.uploadRoute(routeIntMap);
    currentRoute = route;
    notifyListeners();
  }

  @override
  Map<int, HandleStateEnum> getCurrentRoute() {
    return currentRoute;
  }

  @override
  HandleStateEnum getHandleStatus(int id) {
    if (!currentRoute.containsKey(id)) {
      return HandleStateEnum.deactivated;
    }
    return currentRoute[id]!;
  }
}
