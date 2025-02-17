import 'package:laserminipod_server/src/data/route_repository.dart';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class RouteService {
  final RouteRepository _repository;

  RouteService(this._repository);

  Future<void> deleteRoute(Session session, int id) async {
    await _repository.deleteById(session, id);
    session.log('Route with ID: $id successfully deleted',
        level: LogLevel.info);
  }

  Future<bool> saveRoute(Session session, SpraywallRoute route) async {
    try {
      await _repository.insert(session, route);
      session.log('Route saved successfully: ${route.name}',
          level: LogLevel.info);
      return true;
    } catch (e) {
      session.log('Error saving the route: $e', level: LogLevel.error);
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

  Future<List<SpraywallRoute>> loadAllRoutes(Session session) async {
    return await _repository.getAll(session);
  }

  Future<bool> existsRouteAlready(Session session, SpraywallRoute route) async {
    var allRoutes = await _repository.getAll(session);
    return allRoutes.any(
        (existingRoute) => _compareLists(existingRoute.handles, route.handles));
  }

  Future<bool> nameAlreadyAssigned(Session session, String name) async {
    var existingRoutes = await _repository.getByName(session, name);
    return existingRoutes.isNotEmpty;
  }

  void test(Session session) {
    session.log('Test endpoint called: Communication is working!',
        level: LogLevel.info);
  }

  /// Vergleicht zwei Listen (Reihenfolge und Duplikate spielen keine Rolle)
  bool _compareLists(List list1, List list2) {
    return Set.from(list1).containsAll(list2) &&
        Set.from(list2).containsAll(list1);
  }
}
