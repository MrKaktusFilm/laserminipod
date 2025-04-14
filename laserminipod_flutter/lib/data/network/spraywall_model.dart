import 'package:laserminipod_client/src/protocol/client.dart';
import 'package:user_app/data/network/abstract/spraywall_model_abstract.dart';

class SpraywallModel implements SpraywallModelAbstract {
  late EndpointSpraywall _spraywallEndpoint;
  late EndpointSpraywallName _spraywallNameEndpoint;

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
    _spraywallNameEndpoint = client.spraywallName;
  }

  @override
  Future<String?> getSpraywallName() async {
    return await _spraywallNameEndpoint.getSpraywallName();
  }

  @override
  Future<void> setSpraywallName(String name) async {
    await _spraywallNameEndpoint.setSpraywallName(name);
  }
}
