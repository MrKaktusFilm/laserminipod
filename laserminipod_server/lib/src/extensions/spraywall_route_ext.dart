import 'package:laserminipod_server/src/generated/protocol.dart';
import 'package:laserminipod_server/src/generated/spraywall_route.dart';

extension Compare on SpraywallRoute {
  bool areRoutesIdentical(Map<int, int> otherRoute) {
    if (routeHandleStates == null) {
      return false;
    }

    // Vergleiche die Länge der RouteHandleStates-Listen
    if (routeHandleStates!.length != otherRoute.length) {
      return false;
    }

    // Erstelle eine Liste von HandleId -> State für jede Route
    Map<int, int> thisRouteStates = {
      for (var e in routeHandleStates!) e.handleId: e.state
    };

    // Vergleiche, ob beide Routen denselben Satz von HandleId -> State haben
    if (thisRouteStates.length != otherRoute.length) {
      return false;
    }

    for (var handleId in thisRouteStates.keys) {
      if (otherRoute[handleId] != thisRouteStates[handleId]) {
        return false;
      }
    }

    return true;
  }
}
