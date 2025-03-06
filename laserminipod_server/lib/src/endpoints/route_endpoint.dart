import 'package:laserminipod_server/src/di.dart';
import 'package:laserminipod_server/src/domain/route_service.dart';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class RouteEndpoint extends Endpoint {
  final RouteService _routeService = getIt<RouteService>();

  Future<void> deleteRoute(Session session, int id) async {
    await _routeService.deleteRoute(session, id);
  }

  Future<bool> saveRoute(Session session, SpraywallRoute route) async {
    return await _routeService.saveRoute(session, route);
  }

  Future<int> getNewId(Session session) async {
    return await _routeService.getNewId(session);
  }

  Future<List<SpraywallRoute>> loadAllRoutes(Session session) async {
    return await _routeService.loadAllRoutes(session);
  }

  Future<bool> existsRouteAlready(Session session, Map<int, int> route) async {
    return await _routeService.existsRouteAlready(session, route);
  }

  Future<bool> nameAlreadyAssigned(Session session, String name) async {
    return await _routeService.nameAlreadyAssigned(session, name);
  }

  Future<Map<int, int>> getHandleStatesForRoute(
      Session session, int routeId) async {
    return await _routeService.getHandleStatesForRoute(session, routeId);
  }

  Future<void> test(Session session) async {
    _routeService.test(session);
  }
}
