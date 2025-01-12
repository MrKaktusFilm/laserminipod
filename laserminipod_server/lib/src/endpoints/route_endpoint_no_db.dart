import 'package:laserminipod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RouteEndpointNoDB extends Endpoint {
  var routes = <SpraywallRoute>[
    SpraywallRoute(id: 0, name: "test", handles: [0])
  ];
  int idIndex = 0;

  Future<int> deleteRoute(Session session, int id) async {
    routes.removeWhere((SpraywallRoute route) => route.id == id);
    return 1; //TODO: implement success/failure
  }

  Future<SpraywallRoute> loadRoute(Session session, int id) async {
    return routes[id];
  }

  Future<int> saveRoute(Session session, SpraywallRoute route) async {
    routes.add(route.copyWith());
    idIndex++;
    return 1; //TODO: implement success/failure
  }

  Future<int> getNewId(Session session) async {
    return idIndex;
  }

  Future<List<SpraywallRoute>> loadAllRoutes(Session session) async {
    return routes;
  }

  Future<bool> existsRouteAlready(Session session, SpraywallRoute route) async {
    for (var temp in routes) {
      if (temp == route) {
        return true;
      }
    }
    return false;
  }

  Future<bool> nameAlreadyAssigned(Session session, String name) async {
    return routes.any((SpraywallRoute route) => route.name == name);
  }
}
