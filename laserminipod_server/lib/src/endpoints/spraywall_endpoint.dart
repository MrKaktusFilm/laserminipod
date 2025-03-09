import 'package:laserminipod_server/src/di.dart';
import 'package:laserminipod_server/src/domain/spraywall_service.dart';
import 'package:serverpod/serverpod.dart';

class SpraywallEndpoint extends Endpoint {
  final SpraywallService _service = getIt<SpraywallService>();

  Future<void> toggleHandle(Session session, int id, int state) async {
    _service.toggleHandle(id, state);
  }

  Future<void> clearCurrentRoute(Session session) async {
    _service.clearCurrentRoute();
  }

  Future<void> loadRoute(Session session, Map<int, int> route) async {
    _service.loadRoute(session, route);
  }
}
