import 'package:laserminipod_server/src/data/handle_repository.dart' as repo;
import 'package:laserminipod_server/src/data/route_handle_state_repository.dart';
import 'package:serverpod/serverpod.dart';
import '../generated/handle.dart';

class HandleService {
  final repo.HandleRepository _repository;
  final RouteHandleStateRepository _routeHandleStateRepository;

  HandleService(this._repository, this._routeHandleStateRepository);

  Future<List<Handle>> loadAllHandles(Session session) async {
    try {
      return await _repository.getAll(session);
    } catch (e, stackTrace) {
      session.log('Error in loadAllHandles: $e\n$stackTrace',
          level: LogLevel.error);
      rethrow;
    }
  }

  Future<int> addHandle(Session session, int x, int y, int radius) async {
    try {
      var handle = Handle(x: x, y: y, radius: radius);
      int id = await _repository.insert(session, handle);
      session.log('Added handle: x=$x, y=$y, radius=$radius',
          level: LogLevel.info);
      return id;
    } catch (e, stackTrace) {
      session.log('Error in addHandle: $e\n$stackTrace', level: LogLevel.error);
      rethrow;
    }
  }

  Future<void> editHandle(
      Session session, int id, int x, int y, int radius) async {
    try {
      var handle = await _repository.getById(session, id);
      if (handle == null) {
        throw Exception('Handle with id=$id not found.');
      }

      handle.x = x;
      handle.y = y;
      handle.radius = radius;

      await _repository.update(session, handle);
      session.log('Edited handle id=$id: x=$x, y=$y, radius=$radius',
          level: LogLevel.info);
    } catch (e, stackTrace) {
      session.log('Error in editHandle (id=$id): $e\n$stackTrace',
          level: LogLevel.error);
      rethrow;
    }
  }

  Future<void> removeHandle(Session session, int id) async {
    try {
      var handle = await _repository.getById(session, id);
      if (handle == null) {
        throw Exception('Handle with id=$id not found.');
      }
      await _routeHandleStateRepository.deleteRouteHandleStatesForHandle(
          session, id);
      await _repository.delete(session, handle);
      session.log('Removed handle id=$id', level: LogLevel.info);
    } catch (e, stackTrace) {
      session.log('Error in removeHandle (id=$id): $e\n$stackTrace',
          level: LogLevel.error);
      rethrow;
    }
  }
}
