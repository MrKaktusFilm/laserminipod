import 'package:laserminipod_server/src/data/handle_repository.dart' as repo;
import 'package:serverpod/serverpod.dart';
import '../generated/handle.dart';

class HandleService {
  final repo.HandleRepository _repository;

  HandleService(this._repository);

  Future<List<Handle>> loadAllHandles(Session session) async {
    return await _repository.getAll(session);
  }

  Future<int> addHandle(Session session, int x, int y, int radius) async {
    var handle = Handle(x: x, y: y, radius: radius);
    int id = await _repository.insert(session, handle);
    session.log('Added handle: x=$x, y=$y, radius=$radius',
        level: LogLevel.info);
    return id;
  }

  Future<void> editHandle(
      Session session, int id, int x, int y, int radius) async {
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
  }

  Future<void> removeHandle(Session session, int id) async {
    var handle = await _repository.getById(session, id);
    if (handle == null) {
      throw Exception('Handle with id=$id not found.');
    }

    await _repository.delete(session, handle);
    session.log('Removed handle id=$id', level: LogLevel.info);
  }
}
