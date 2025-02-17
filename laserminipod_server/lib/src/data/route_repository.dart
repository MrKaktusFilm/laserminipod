import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class RouteRepository {
  Future<void> deleteById(Session session, int id) async {
    await SpraywallRoute.db.deleteWhere(session, where: (t) => t.id.equals(id));
  }

  Future<void> insert(Session session, SpraywallRoute route) async {
    await SpraywallRoute.db.insert(session, [route]);
  }

  Future<List<SpraywallRoute>> getAll(Session session) async {
    return await SpraywallRoute.db.find(session);
  }

  Future<List<SpraywallRoute>> getByName(Session session, String name) async {
    return await SpraywallRoute.db
        .find(session, where: (t) => t.name.equals(name));
  }

  Future<int> getNewId(Session session) async {
    var result = await session.db
        .unsafeQuery('SELECT MAX(id) AS max_id FROM spraywallroute');
    return (result.isNotEmpty ? (result.first as int?) : 0)! + 1;
  }
}
