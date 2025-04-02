import 'package:laserminipod_client/laserminipod_client.dart';

abstract class SpraywallModelAbstract {
  Future<void> toggleHandle(int id, int state);

  Future<void> clearCurrentRoute();

  Future<void> uploadRoute(Map<int, int> route);

  void initialize(Client client);
}
