import 'package:laserminipod_server/src/di.dart';
import 'package:laserminipod_server/src/domain/spraywall_name_service.dart';
import 'package:serverpod/serverpod.dart';

class SpraywallNameEndpoint extends Endpoint {
  final SpraywallNameService _spraywallNameService =
      getIt<SpraywallNameService>();

  Future<String?> getSpraywallName(Session session) async {
    return await _spraywallNameService.getSpraywallName(session);
  }

  Future<void> setSpraywallName(Session session, String name) async {
    await _spraywallNameService.setSpraywallName(session, name);
  }
}
