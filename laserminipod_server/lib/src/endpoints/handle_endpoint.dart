import 'package:laserminipod_server/src/di.dart';
import 'package:laserminipod_server/src/extensions/endpoint_ext.dart';
import 'package:laserminipod_server/src/domain/handle_service.dart';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class HandleEndpoint extends Endpoint {
  final HandleService _handleService = getIt<HandleService>();

  Future<List<Handle>> loadAllHandles(Session session) async {
    return await _handleService.loadAllHandles(session);
  }

  /// returns id of created handle
  Future<int> addHandle(Session session, int x, int y, int radius) async {
    await validateAdminScope(session);
    return await _handleService.addHandle(session, x, y, radius);
  }

  Future<void> editHandle(
      Session session, int id, int x, int y, int radius) async {
    await validateAdminScope(session);
    await _handleService.editHandle(session, id, x, y, radius);
  }

  Future<void> removeHandle(Session session, int id) async {
    await validateAdminScope(session);
    await _handleService.removeHandle(session, id);
  }
}
