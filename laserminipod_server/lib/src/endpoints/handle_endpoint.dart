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
}
