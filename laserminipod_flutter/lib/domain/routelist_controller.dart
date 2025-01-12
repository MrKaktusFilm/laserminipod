import 'package:user_app/common/entities/route.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
import 'package:user_app/domain/abstract/routelist_controller_abstract.dart';

class RoutelistController extends RoutelistControllerAbstract {
  final RouteModelAbstract routeModel;

  RoutelistController({required this.routeModel});

  @override
  List<SpraywallRoute> loadAllRoutes() {
    return routeModel.loadAllRoutes();
  }
}
