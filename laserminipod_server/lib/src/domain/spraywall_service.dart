import 'package:laserminipod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SpraywallService {
  List<int> currentRoute = [];

  bool toggleHandle(int id) {
    if (currentRoute.contains(id)) {
      currentRoute.remove(id);
      return false;
    } else {
      currentRoute.add(id);
      return true;
    }
  }

  void clearCurrentRoute() {
    currentRoute = [];
  }

  /// loads the given route to the spraywall screen panel
  void loadRoute(Session session, SpraywallRoute route) {
    currentRoute = route.handles;
    session.log('Loaded route. ID: ${route.id}');
  }

  bool isHandleActivated(int id) {
    return currentRoute.contains(id);
  }
}
