import 'package:user_app/data/abstract/spraywall_model_abstract.dart';
import 'package:user_app/main.dart';

class SpraywallModel implements SpraywallModelAbstract {
  @override
  Future<void> toggleHandle(int id, int state) async {
    await client.spraywall.toggleHandle(id, state);
  }

  @override
  Future<void> clearCurrentRoute() async {
    await client.spraywall.clearCurrentRoute();
  }

  @override
  Future<void> uploadRoute(Map<int, int> route) async {
    await client.spraywall.loadRoute(route);
  }
}
