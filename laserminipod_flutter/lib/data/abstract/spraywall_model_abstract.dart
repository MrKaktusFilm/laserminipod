import 'package:laserminipod_client/laserminipod_client.dart';

abstract class SpraywallModelAbstract {
  Future<bool> toggleHandle(int id);

  Future<void> clearCurrentRoute();

  Future<void> loadRoute(SpraywallRoute route);

  Future<bool> isHandleActivated(int id);
}
