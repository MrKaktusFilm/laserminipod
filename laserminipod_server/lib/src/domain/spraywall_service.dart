import 'package:serverpod/serverpod.dart';
import 'cpp_service.dart';

class SpraywallService {
  final CppService _cppService;
  Map<int, int> currentRoute = {};

  SpraywallService(this._cppService);

  void toggleHandle(int id, int status) {
    if (status == 4 && currentRoute.containsKey(id)) {
      currentRoute.remove(id);
      return;
    }
    currentRoute[id] = status;
  }

  void clearCurrentRoute() {
    currentRoute = {};
    _cppService.hello(1, 10, 325.53);
  }

  /// loads the given route to the spraywall screen panel
  void loadRoute(Session session, Map<int, int> route) {
    currentRoute = Map.from(route);
  }
}
