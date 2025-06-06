import 'package:laserminipod_client/laserminipod_client.dart';

abstract class RouteModelAbstract {
  Future<void> deleteRoute(int id);

  Future<bool> saveRoute(SpraywallRoute route);

  Future<List<SpraywallRoute>> loadAllRoutes();

  Future<bool> existsRouteAlready(Map<int, int> route);

  Future<bool> nameAlreadyAssigned(String name);

  Future<Map<int, int>> getHandleStatesForRoute(int routeId);

  Future<void> addProjectForUser(int routeId, int userId);

  Future<void> deleteProjectForUser(int routeId, int userId);

  Future<void> addSentForUser(int routeId, int userId);

  Future<void> deleteSentForUser(int routeId, int userId);

  Future<List<int>> loadProjects(int userId);

  Future<List<RouteUserSents>> loadSents();

  bool isSent(int routeId, int userId);

  List<SpraywallRoute> get allRoutes;

  List<RouteUserSents> get allSents;

  Future<void> loadLikesForUser(int userId);

  Future<Map<int, int>> loadLikeCounts();

  List<int> getLikesForLoggedInUser();

  Future<void> toggleLikeForUser(int routeId, int userId);

  void initialize(Client client);
}
