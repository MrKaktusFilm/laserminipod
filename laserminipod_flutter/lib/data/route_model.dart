import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';

import 'package:user_app/main.dart';

class RouteModel extends RouteModelAbstract {
  var routes = <SpraywallRoute>[];
  int idIndex = 0;

  @override
  Future<void> deleteRoute(int id) async {
    try {
      await client.routeEndpointNoDB.deleteRoute(id);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<SpraywallRoute> loadRoute(int id) async {
    try {
      return await client.routeEndpointNoDB.loadRoute(id);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> saveRoute(SpraywallRoute route) async {
    try {
      return await client.routeEndpointNoDB.saveRoute(route.copyWith());
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<SpraywallRoute>> loadAllRoutes() async {
    try {
      return await client.routeEndpointNoDB.loadAllRoutes();
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> existsRouteAlready(SpraywallRoute route) async {
    try {
      return await client.routeEndpointNoDB.existsRouteAlready(route);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> nameAlreadyAssigned(String name) async {
    try {
      return await client.routeEndpointNoDB.nameAlreadyAssigned(name);
    } on Exception {
      rethrow;
    }
  }
}
