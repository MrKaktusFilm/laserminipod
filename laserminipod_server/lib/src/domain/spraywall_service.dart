import 'package:laserminipod_server/src/domain/cpp_service.dart';
import 'package:laserminipod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SpraywallService {
  SpraywallRoute currentRoute =
      SpraywallRoute(handles: <int>[], id: 0, name: "");
  final CppService cppService;

  SpraywallService(this.cppService);

  bool toggleHandle(int id) {
    if (currentRoute.handles.contains(id)) {
      currentRoute.handles.remove(id);
      return false;
    } else {
      currentRoute.handles.add(id);
      return true;
    }
  }

  void clearCurrentRoute() {
    currentRoute.handles = [];
    cppService.hello();
  }

  /// loads the given route to the spraywall screen panel
  void loadRoute(Session session, SpraywallRoute route) {
    currentRoute = route.copyWith();
    session.log('Loaded route. ID: ${currentRoute.id}');
  }

  SpraywallRoute getCurrentRoute() {
    return currentRoute;
  }

  bool isHandleActivated(int id) {
    return currentRoute.handles.contains(id);
  }
}
