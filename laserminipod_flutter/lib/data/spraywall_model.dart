import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/spraywall_model_abstract.dart';
import 'package:user_app/main.dart';

class SpraywallModel implements SpraywallModelAbstract {
  @override
  Future<bool> toggleHandle(int id) async {
    return await client.spraywall.toggleHandle(id);
  }

  @override
  Future<void> clearCurrentRoute() async {
    await client.spraywall.clearCurrentRoute();
  }

  @override
  Future<void> loadRoute(SpraywallRoute route) async {
    await client.spraywall.loadRoute(route);
  }

  @override
  Future<SpraywallRoute> getCurrentRoute() async {
    return await client.spraywall.getCurrentRoute();
  }

  @override
  Future<bool> isHandleActivated(int id) async {
    return await client.spraywall.isHandleActivated(id);
  }
}
