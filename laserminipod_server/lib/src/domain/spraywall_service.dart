import 'package:serverpod/serverpod.dart';

class SpraywallService {
  Map<int, int> currentRoute = {};

  void toggleHandle(int id, int status) {
    if (status == 4 && currentRoute.containsKey(id)) {
      currentRoute.remove(id);
      return;
    }
    currentRoute[id] = status;
  }

  void clearCurrentRoute() {
    currentRoute = {};
  }

  /// loads the given route to the spraywall screen panel
  void loadRoute(Session session, Map<int, int> route) {
    currentRoute = Map.from(route);
  }
}
