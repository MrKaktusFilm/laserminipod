import 'package:laserminipod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RouteUserProjectsRepository {
  Future<void> addRouteForUser(Session session, int routeId, int userId) async {
    var routeUserProject = RouteUserProjects(
      routeId: routeId,
      userId: userId,
    );
    await RouteUserProjects.db.insert(session, [routeUserProject]);
  }

  Future<void> deleteRouteForUser(
      Session session, int routeId, int userId) async {
    await RouteUserProjects.db.deleteWhere(
      session,
      where: (t) {
        return t.routeId.equals(routeId) & t.userId.equals(userId);
      },
    );
  }

  Future<List<RouteUserProjects>> loadRoutesForUser(
      Session session, int userId) async {
    return await RouteUserProjects.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );
  }
}
