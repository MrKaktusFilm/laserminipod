import 'package:laserminipod_client/src/protocol/client.dart';
import 'package:user_app/data/abstract/spraywall_model_abstract.dart';

class SpraywallModel implements SpraywallModelAbstract {
  late EndpointSpraywall _spraywallEndpoint;

  @override
  Future<void> toggleHandle(int id, int state) async {
    await _spraywallEndpoint.toggleHandle(id, state);
  }

  @override
  Future<void> clearCurrentRoute() async {
    await _spraywallEndpoint.clearCurrentRoute();
  }

  @override
  Future<void> uploadRoute(Map<int, int> route) async {
    await _spraywallEndpoint.loadRoute(route);
  }

  @override
  void initialize(Client client) {
    _spraywallEndpoint = client.spraywall;
  }
}
