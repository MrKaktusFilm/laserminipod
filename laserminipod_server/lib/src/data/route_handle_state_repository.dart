import 'package:laserminipod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RouteHandleStateRepository {
  Future<List<RouteHandleState>> getRouteHandleStates(
      Session session, int routeId) async {
    return await RouteHandleState.db
        .find(session, where: (p0) => p0.routeId.equals(routeId));
  }
}
