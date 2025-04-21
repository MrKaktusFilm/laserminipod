import 'package:laserminipod_server/src/generated/route_likes.dart';
import 'package:serverpod/serverpod.dart';

class RouteLikesRepository {
  Future<List<int>> getLikesForUser(Session session, int userId) async {
    var result = await RouteLikes.db
        .find(session, where: (p0) => p0.userId.equals(userId));
    return result.map((like) => like.routeId).toList();
  }

  Future<List<RouteLikes>> getAllLikes(Session session) async {
    return await RouteLikes.db.find(session);
  }

  Future<void> addLikeForUser(Session session, int routeId, int userId) async {
    await RouteLikes.db
        .insert(session, [RouteLikes(routeId: routeId, userId: userId)]);
  }

  Future<void> deleteLikeForUser(
      Session session, int routeId, int userId) async {
    await RouteLikes.db.deleteWhere(session,
        where: (p0) => p0.routeId.equals(routeId) & p0.userId.equals(userId));
  }

  Future<bool> hasUserLikedRoute(
      Session session, int routeId, int userId) async {
    var result = await RouteLikes.db.find(session,
        where: (p0) => p0.routeId.equals(routeId) & p0.userId.equals(userId));
    return result.isNotEmpty;
  }

  Future<void> deleteLikesForRoute(Session session, int routeId) async {
    await RouteLikes.db
        .deleteWhere(session, where: (p0) => p0.routeId.equals(routeId));
  }
}
