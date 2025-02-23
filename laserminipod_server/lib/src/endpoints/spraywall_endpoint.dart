import 'package:laserminipod_server/src/di.dart';
import 'package:laserminipod_server/src/domain/spraywall_service.dart';
import 'package:serverpod/serverpod.dart';
import 'package:laserminipod_server/src/generated/protocol.dart';

class SpraywallEndpoint extends Endpoint {
  final SpraywallService _service = getIt<SpraywallService>();

  Future<bool> toggleHandle(Session session, int id) async {
    return _service.toggleHandle(id);
  }

  Future<void> clearCurrentRoute(Session session) async {
    _service.clearCurrentRoute();
  }

  Future<void> loadRoute(Session session, SpraywallRoute route) async {
    _service.loadRoute(session, route);
  }

  Future<SpraywallRoute> getCurrentRoute(Session session) async {
    return _service.getCurrentRoute();
  }

  Future<bool> isHandleActivated(Session session, int id) async {
    return _service.isHandleActivated(id);
  }
}
