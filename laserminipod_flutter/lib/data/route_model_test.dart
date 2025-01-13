import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/route_model_test_abstract.dart';

import 'package:user_app/main.dart';

class RouteModelTest extends RouteModelTestAbstract {
  var routes = <SpraywallRoute>[];
  int idIndex = 0;

  @override
  void deleteRoute(int id) {
    routes.removeWhere((SpraywallRoute route) => route.id == id);
  }

  @override
  SpraywallRoute loadRoute(int id) {
    return routes[id];
  }

  @override
  void saveRoute(SpraywallRoute route) {
    routes.add(route.copyWith());
    idIndex++;
  }

  @override
  int getNewId() {
    return idIndex;
  }

  @override
  Future<List<SpraywallRoute>> loadAllRoutes() async {
    try {
      return await client.routeEndpointNoDB.loadAllRoutes();
    } on Exception {
      rethrow;
    }
  }

  @override
  bool existsRouteAlready(SpraywallRoute route) {
    for (var temp in routes) {
      if (temp == route) {
        return true;
      }
    }
    return false;
  }

  @override
  bool nameAlreadyAssigned(String name) {
    return routes.any((SpraywallRoute route) => route.name == name);
  }
}
