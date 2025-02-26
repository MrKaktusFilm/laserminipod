import 'package:laserminipod_client/laserminipod_client.dart';

abstract class RouteModelAbstract {
  Future<void> deleteRoute(int id);

  Future<bool> saveRoute(SpraywallRoute route);

  Future<List<SpraywallRoute>> loadAllRoutes();

  Future<bool> existsRouteAlready(List<int> route);

  Future<bool> nameAlreadyAssigned(String name);
}
