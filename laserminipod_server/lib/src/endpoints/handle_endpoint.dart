import 'package:laserminipod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class HandleEndpoint extends Endpoint {
  Future<List<Handle>> loadAllHandles(Session session) async {
    try {
      session.log('Loading all handles from the database',
          level: LogLevel.info);
      var handles = await Handle.db.find(session);
      session.log('Loaded ${handles.length} handles from the database',
          level: LogLevel.info);
      return handles;
    } catch (e) {
      session.log('Failed to load handles. Error: $e', level: LogLevel.error);
      return [];
    }
  }

  Future<bool> addHandle(Session session, int x, int y, int radius) async {
    try {
      var handle = Handle(x: x, y: y, radius: radius);
      await Handle.db.insert(session, [handle]);
      session.log('Added handle: x=$x, y=$y, radius=$radius',
          level: LogLevel.info);
      return true;
    } catch (e) {
      session.log('Failed to add handle. Error: $e', level: LogLevel.error);
      return false;
    }
  }

  Future<bool> editHandle(
      Session session, int id, int x, int y, int radius) async {
    try {
      var handle = await Handle.db.findById(session, id);
      if (handle == null) {
        session.log('Handle with id=$id not found.', level: LogLevel.warning);
        return false;
      }

      handle.x = x;
      handle.y = y;
      handle.radius = radius;

      await Handle.db.update(session, [handle]);
      session.log('Edited handle id=$id: x=$x, y=$y, radius=$radius',
          level: LogLevel.info);
      return true;
    } catch (e) {
      session.log('Failed to edit handle. Error: $e', level: LogLevel.error);
      return false;
    }
  }

  Future<bool> removeHandle(Session session, int id) async {
    try {
      var handle = await Handle.db.findById(session, id);
      if (handle == null) {
        session.log('Handle with id=$id not found.', level: LogLevel.warning);
        return false;
      }

      await Handle.db.delete(session, [handle]);
      session.log('Removed handle id=$id', level: LogLevel.info);
      return true;
    } catch (e) {
      session.log('Failed to remove handle. Error: $e', level: LogLevel.error);
      return false;
    }
  }
}
