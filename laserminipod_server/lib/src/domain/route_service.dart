import 'package:collection/collection.dart';
import 'package:laserminipod_server/src/data/route_handle_state_repository.dart'
    as state;
import 'package:laserminipod_server/src/data/route_repository.dart';
import 'package:laserminipod_server/src/data/route_user_projects_repository.dart';
import 'package:laserminipod_server/src/data/route_user_sents_repository.dart';
import 'package:laserminipod_server/src/generated/route_user_sents.dart'
    as sents;
import 'package:laserminipod_server/src/generated/spraywall_route.dart';
import 'package:serverpod/serverpod.dart';
import 'package:laserminipod_server/src/data/route_likes_repository.dart';

class RouteService {
  final RouteRepository _repository;
  final state.RouteHandleStateRepository _handleStateRepository;
  final RouteUserProjectsRepository _routeUserProjectsRepository;
  final RouteUserSentsRepository _routeUserSentsRepository;
  final RouteLikesRepository _routeLikesRepository;

  RouteService(
    this._repository,
    this._handleStateRepository,
    this._routeUserProjectsRepository,
    this._routeUserSentsRepository,
    this._routeLikesRepository,
  );

  Future<void> deleteRoute(Session session, int id) async {
    try {
      await _handleStateRepository.deleteRouteHandleStatesForRoutes(
          session, id);
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

  Future<List<int>> loadProjects(Session session, int userId) async {
    var routes =
        await _routeUserProjectsRepository.loadRoutesForUser(session, userId);
    return routes.map((route) => route.routeId).toList();
  }

  Future<List<sents.RouteUserSents>> loadSents(Session session) async {
    return await _routeUserSentsRepository.loadAllSents(session);
  }

  Future<void> addProjectForUser(
      Session session, int routeId, int userId) async {
    await _routeUserProjectsRepository.addRouteForUser(
        session, routeId, userId);
  }

  Future<void> deleteProjectForUser(
      Session session, int routeId, int userId) async {
    await _routeUserProjectsRepository.deleteRouteForUser(
        session, routeId, userId);
  }

  Future<void> addSentForUser(Session session, int routeId, int userId) async {
    await _routeUserSentsRepository.addRouteForUser(session, routeId, userId);
  }

  Future<void> deleteSentForUser(
      Session session, int routeId, int userId) async {
    await _routeUserSentsRepository.deleteRouteForUser(
        session, routeId, userId);
  }

  /// returns list of routeIds that the user has liked
  Future<List<int>> getLikesForUser(Session session, int userId) async {
    try {
      return await _routeLikesRepository.getLikesForUser(session, userId);
    } catch (e, stackTrace) {
      session.log('Error getting likes for user: $e\n$stackTrace',
          level: LogLevel.error);
      rethrow;
    }
  }

  /// returns a map with routeId as key and number of likes as value
  Future<Map<int, int>> getLikeCountsForRoutes(Session session) async {
    try {
      var likes = await _routeLikesRepository.getAllLikes(session);
      var likeCounts = <int, int>{};
      for (var like in likes) {
        likeCounts.update(like.routeId, (value) => value + 1,
            ifAbsent: () => 1);
      }
      return likeCounts;
    } catch (e, stackTrace) {
      session.log('Error getting likes for routes: $e\n$stackTrace',
          level: LogLevel.error);
      rethrow;
    }
  }

  Future<void> toggleLikeForUser(
      Session session, int routeId, int userId) async {
    try {
      var hasLiked = await _routeLikesRepository.hasUserLikedRoute(
          session, routeId, userId);
      if (hasLiked) {
        await _routeLikesRepository.deleteLikeForUser(session, routeId, userId);
      } else {
        await _routeLikesRepository.addLikeForUser(session, routeId, userId);
      }
    } catch (e, stackTrace) {
      session.log('Error adding like for user: $e\n$stackTrace',
          level: LogLevel.error);
      rethrow;
    }
  }
}
