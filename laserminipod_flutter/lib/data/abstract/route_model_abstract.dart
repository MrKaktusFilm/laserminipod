import 'package:user_app/common/entities/route.dart';

abstract class RouteModelAbstract {
  void deleteRoute(int id);

  void saveRoute(SpraywallRoute route);

  SpraywallRoute loadRoute(int id);

  List<SpraywallRoute> loadAllRoutes();

  bool existsRouteAlready(SpraywallRoute route);

  bool nameAlreadyAssigned(String name);

  // Returns unsed ID for adding routes
  int getNewId();
}
