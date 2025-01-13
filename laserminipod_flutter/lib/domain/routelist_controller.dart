import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/route_model_test_abstract.dart';
import 'package:user_app/domain/abstract/routelist_controller_abstract.dart';

class RoutelistController extends RoutelistControllerAbstract {
  RoutelistController({required this.routeModel});

  final RouteModelTestAbstract routeModel;
  List<SpraywallRoute> routes = [];

  // Load routes from the server
  @override
  Future<List<SpraywallRoute>> loadAllRoutes() async {
    try {
      return routeModel.loadAllRoutes();
    } on Exception {
      rethrow;
    }
  }

  @override
  List<SpraywallRoute> getAllRoutes() {
    return routes;
  }
}
