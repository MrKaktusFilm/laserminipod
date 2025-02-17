import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class HandleRepository {
  Future<List<Handle>> getAll(Session session) async {
    return await Handle.db.find(session);
  }

  Future<Handle?> getById(Session session, int id) async {
    return await Handle.db.findById(session, id);
  }

  Future<int> insert(Session session, Handle handle) async {
    var handles = await Handle.db.insert(session, [handle]);
    return handles[0].id!;
  }

  Future<void> update(Session session, Handle handle) async {
    await Handle.db.update(session, [handle]);
  }

  Future<void> delete(Session session, Handle handle) async {
    await Handle.db.delete(session, [handle]);
  }
}
