import 'package:laserminipod_client/laserminipod_client.dart';

abstract class RouteModelAbstract {
  Future<void> deleteRoute(int id);

  Future<void> saveRoute(SpraywallRoute route);

  Future<SpraywallRoute> loadRoute(int id);

  Future<List<SpraywallRoute>> loadAllRoutes();

  Future<bool> existsRouteAlready(SpraywallRoute route);

  Future<bool> nameAlreadyAssigned(String name);
}
