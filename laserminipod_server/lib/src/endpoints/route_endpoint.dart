import 'package:laserminipod_server/src/extensions/endpoint_ext.dart';
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
    await validateUserScope(session);
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

  Future<List<int>> loadProjects(Session session, int userId) async {
    await validateUserScope(session);
    return await _routeService.loadProjects(session, userId);
  }

  Future<List<RouteUserSents>> loadSents(Session session) async {
    await validateUserScope(session);
    return await _routeService.loadSents(session);
  }

  Future<void> addProjectForUser(
      Session session, int routeId, int userId) async {
    await validateUserScope(session);
    await _routeService.addProjectForUser(session, routeId, userId);
  }

  Future<void> deleteProjectForUser(
      Session session, int routeId, int userId) async {
    await validateUserScope(session);
    await _routeService.deleteProjectForUser(session, routeId, userId);
  }

  Future<void> addSentForUser(Session session, int routeId, int userId) async {
    await validateUserScope(session);
    await _routeService.addSentForUser(session, routeId, userId);
  }

  Future<void> deleteSentForUser(
      Session session, int routeId, int userId) async {
    await validateUserScope(session);
    await _routeService.deleteSentForUser(session, routeId, userId);
  }
}
