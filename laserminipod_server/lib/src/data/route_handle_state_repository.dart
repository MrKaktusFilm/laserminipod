import 'package:laserminipod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RouteHandleStateRepository {
  Future<List<RouteHandleState>> getRouteHandleStates(
      Session session, int routeId) async {
    return await RouteHandleState.db
        .find(session, where: (p0) => p0.routeId.equals(routeId));
  }

  Future<void> deleteRouteHandleStatesForRoutes(
      Session session, int routeId) async {
    var deletedStates = await RouteHandleState.db
        .deleteWhere(session, where: (state) => state.routeId.equals(routeId));
    session
        .log('${deletedStates.length} routeHandleStates successfully deleted');
  }

  Future<void> deleteRouteHandleStatesForHandle(
      Session session, int handleId) async {
    var deletedStates = await RouteHandleState.db.deleteWhere(session,
        where: (state) => state.handleId.equals(handleId));
    session
        .log('${deletedStates.length} routeHandleStates successfully deleted');
  }
}
