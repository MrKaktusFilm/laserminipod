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

  Future<bool> saveRoute(Session session, SpraywallRoute route) async {
    routes.add(route.copyWith());
    idIndex++;
    return true;
  }

  Future<int> getNewId(Session session) async {
    return idIndex;
  }

  Future<List<SpraywallRoute>> loadAllRoutes(Session session) async {
    return routes;
  }

  Future<bool> existsRouteAlready(Session session, SpraywallRoute route) async {
    for (var temp in routes) {
      if (compareLists(temp.handles, route.handles)) {
        // routes are equal, if they consist of the same handles
        print(true);
        return true;
      }
    }
    print(false);
    return false;
  }

  Future<bool> nameAlreadyAssigned(Session session, String name) async {
    return routes.any((SpraywallRoute route) => route.name == name);
  }

  Future<void> test(Session session) async {
    print("Kommunikation funktioniert!");
  }

  /// compares two lists, order and duplicates don't matter
  bool compareLists(List list1, List list2) {
    return Set.from(list1).containsAll(list2) &&
        Set.from(list2).containsAll(list1);
  }
}
