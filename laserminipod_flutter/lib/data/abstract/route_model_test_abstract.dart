import 'package:laserminipod_client/laserminipod_client.dart';

abstract class RouteModelTestAbstract {
  void deleteRoute(int id);

  void saveRoute(SpraywallRoute route);

  SpraywallRoute loadRoute(int id);

  Future<List<SpraywallRoute>> loadAllRoutes();

  bool existsRouteAlready(SpraywallRoute route);

  bool nameAlreadyAssigned(String name);

  // Returns unsed ID for adding routes
  int getNewId();
}
