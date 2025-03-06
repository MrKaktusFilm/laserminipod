import 'package:collection/collection.dart';
import 'package:laserminipod_server/src/data/route_handle_state_repository.dart';
import 'package:laserminipod_server/src/data/route_repository.dart';
import 'package:laserminipod_server/src/generated/spraywall_route.dart';
import 'package:serverpod/serverpod.dart';

class RouteService {
  final RouteRepository _repository;
  final RouteHandleStateRepository _handleStateRepository;

  RouteService(this._repository, this._handleStateRepository);

  Future<void> deleteRoute(Session session, int id) async {
    await _handleStateRepository.deleteRouteHandleStates(session, id);
    await _repository.deleteById(session, id);
    session.log('Route with ID: $id successfully deleted',
        level: LogLevel.info);
  }

  /// save routes with handleRouteStates
  Future<bool> saveRoute(Session session, SpraywallRoute route) async {
    try {
      await _repository.insert(session, route);
      session.log('Route saved successfully: ${route.name}',
          level: LogLevel.info);
      return true;
    } catch (e, stacktrace) {
      session.log('Error saving the route: $e',
          level: LogLevel.error, stackTrace: stacktrace);
      return false;
    }
  }

  Future<int> getNewId(Session session) async {
    try {
      return await _repository.getNewId(session);
    } catch (e) {
      session.log('Error while generating a new unique ID. Error: $e',
          level: LogLevel.error);
      return -1; // Indicates an error
    }
  }

  /// load routes withour handleRouteStates
  Future<List<SpraywallRoute>> loadAllRoutes(Session session) async {
    return await _repository.getAll(session);
  }

  Future<bool> existsRouteAlready(Session session, Map<int, int> route) async {
    var allRoutes = await _getHandleStatesForAllRoutes(session);
    return allRoutes
        .any((existingRoute) => MapEquality().equals(existingRoute, route));
  }

  Future<bool> nameAlreadyAssigned(Session session, String name) async {
    var existingRoutes = await _repository.getByName(session, name);
    return existingRoutes.isNotEmpty;
  }

  Future<Map<int, int>> getHandleStatesForRoute(
      Session session, int routeId) async {
    var stateList =
        await _handleStateRepository.getRouteHandleStates(session, routeId);
    Map<int, int> stateMap = {};
    for (var state in stateList) {
      stateMap[state.handleId] = state.state;
    }
    return stateMap;
  }

  Future<List<Map<int, int>>> _getHandleStatesForAllRoutes(
      Session session) async {
    List<int> routeIds = await _repository.getAllIds(session);
    List<Map<int, int>> maps = [];
    for (var id in routeIds) {
      maps.add(await getHandleStatesForRoute(session, id));
    }
    return maps;
  }

  void test(Session session) {
    session.log('Test endpoint called: Communication is working!',
        level: LogLevel.info);
  }
}
