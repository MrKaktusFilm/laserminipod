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
    try {
      await _handleStateRepository.deleteRouteHandleStates(session, id);
      await _repository.deleteById(session, id);
      session.log('Route with ID: $id successfully deleted',
          level: LogLevel.info);
    } on Exception catch (e, stackTrace) {
      session.log('Error deleting route: $e\n$stackTrace',
          level: LogLevel.error);
      rethrow;
    }
  }

  /// save routes with handleRouteStates
  Future<bool> saveRoute(Session session, SpraywallRoute route) async {
    try {
      await _repository.insert(session, route);
      session.log('Route saved successfully: ${route.name}',
          level: LogLevel.info);
      return true;
    } catch (e, stacktrace) {
      session.log('Error saving the route: $e\n$stacktrace',
          level: LogLevel.error, stackTrace: stacktrace);
      rethrow;
    }
  }

  Future<int> getNewId(Session session) async {
    try {
      return await _repository.getNewId(session);
    } catch (e, stackTrace) {
      session.log(
          'Error while generating a new unique ID. Error: $e\n$stackTrace',
          level: LogLevel.error);
      rethrow;
    }
  }

  /// load routes withour handleRouteStates
  Future<List<SpraywallRoute>> loadAllRoutes(Session session) async {
    try {
      return await _repository.getAll(session);
    } on Exception catch (e, stackTrace) {
      session.log('Error loading all routes: $e\n$stackTrace',
          level: LogLevel.error);
      rethrow;
    }
  }

  Future<bool> existsRouteAlready(Session session, Map<int, int> route) async {
    try {
      var allRoutes = await _getHandleStatesForAllRoutes(session);
      return allRoutes
          .any((existingRoute) => MapEquality().equals(existingRoute, route));
    } on Exception catch (e, stackTrace) {
      session.log(
          'Error getting all handle states for all routes: $e\n$stackTrace',
          level: LogLevel.error);
      rethrow;
    }
  }

  Future<bool> nameAlreadyAssigned(Session session, String name) async {
    try {
      var existingRoutes = await _repository.getByName(session, name);
      return existingRoutes.isNotEmpty;
    } on Exception catch (e, stackTrace) {
      session.log(
          'Error checking whether name $name is already assigned: $e\n$stackTrace',
          level: LogLevel.error);
      rethrow;
    }
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
    try {
      List<int> routeIds = await _repository.getAllIds(session);
      List<Map<int, int>> maps = [];
      for (var id in routeIds) {
        maps.add(await getHandleStatesForRoute(session, id));
      }
      return maps;
    } on Exception catch (e, stackTrace) {
      session.log(
          'Error getting all handle states for all routes: $e\n$stackTrace',
          level: LogLevel.error);
      rethrow;
    }
  }
}
