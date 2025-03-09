import 'package:laserminipod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RouteUserSentsRepository {
  Future<void> addRouteForUser(Session session, int routeId, int userId) async {
    var routeUserSent = RouteUserSents(
      routeId: routeId,
      userId: userId,
    );
    await RouteUserSents.db.insert(session, [routeUserSent]);
  }

  Future<void> deleteRouteForUser(
      Session session, int routeId, int userId) async {
    await RouteUserSents.db.deleteWhere(
      session,
      where: (t) {
        return t.routeId.equals(routeId) & t.userId.equals(userId);
      },
    );
  }

  Future<List<RouteUserSents>> loadRoutesForUser(
      Session session, int userId) async {
    return await RouteUserSents.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );
  }
}
