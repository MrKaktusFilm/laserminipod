import 'package:laserminipod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RouteEndpointNoDB extends Endpoint {
  var routes = <SpraywallRoute>[
    SpraywallRoute(id: 0, name: "test", handles: [0])
  ];
  int idIndex = 0;

  Future<void> deleteRoute(Session session, int id) async {
    routes.removeWhere((SpraywallRoute route) => route.id == id);
  }

  Future<SpraywallRoute> loadRoute(Session session, int id) async {
    return routes[id];
  }

  Future<void> saveRoute(Session session, SpraywallRoute route) async {
    routes.add(route.copyWith());
    idIndex++;
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

  Future<void> test(Session session) async {
    print("Kommunikation funktioniert!");
  }
}
