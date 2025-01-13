import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
import 'package:user_app/main.dart';

class RouteModel extends RouteModelAbstract {
  @override
  void deleteRoute(int id) {
    // TODO: implement deleteRoute
  }

  @override
  bool existsRouteAlready(SpraywallRoute route) {
    // TODO: implement existsRouteAlready
    throw UnimplementedError();
  }

  @override
  int getNewId() {
    // TODO: implement getNewId
    throw UnimplementedError();
  }

  @override
  Future<List<SpraywallRoute>> loadAllRoutes() async {
    return await client.routeEndpointNoDB.loadAllRoutes();
  }

  @override
  SpraywallRoute loadRoute(int id) {
    // TODO: implement loadRoute
    throw UnimplementedError();
  }

  @override
  bool nameAlreadyAssigned(String name) {
    // TODO: implement nameAlreadyAssigned
    throw UnimplementedError();
  }

  @override
  void saveRoute(SpraywallRoute route) {
    // TODO: implement saveRoute
  }

  @override
  void test() {
    // TODO: implement test
  }
}
