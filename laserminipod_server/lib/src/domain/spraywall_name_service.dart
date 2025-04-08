import 'package:laserminipod_server/src/data/spraywall_name_repository.dart';
import 'package:serverpod/serverpod.dart';

class SpraywallNameService {
  final SpraywallNameRepository _spraywallNameRepository;

  SpraywallNameService(
      {required SpraywallNameRepository spraywallNameRepository})
      : _spraywallNameRepository = spraywallNameRepository;

  Future<String?> getSpraywallName(Session session) async {
    return await _spraywallNameRepository.getName(session);
  }

  Future<void> setSpraywallName(Session session, String name) async {
    await _spraywallNameRepository.setName(session, name);
    session.log('Spraywall name set to "$name"');
  }
}
