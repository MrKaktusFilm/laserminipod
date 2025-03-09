import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';

import 'package:user_app/main.dart';

class RouteModel extends RouteModelAbstract {
  var routes = <SpraywallRoute>[];
  int idIndex = 0;
  var routeEndpoint = client.route;

  @override
  Future<void> deleteRoute(int id) async {
    try {
      await routeEndpoint.deleteRoute(id);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> saveRoute(SpraywallRoute route) async {
    try {
      return await routeEndpoint.saveRoute(route.copyWith());
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<SpraywallRoute>> loadAllRoutes() async {
    try {
      return await routeEndpoint.loadAllRoutes();
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> existsRouteAlready(Map<int, int> route) async {
    try {
      return await routeEndpoint.existsRouteAlready(route);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> nameAlreadyAssigned(String name) async {
    try {
      return await routeEndpoint.nameAlreadyAssigned(name);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Map<int, int>> getHandleStatesForRoute(int routeId) async {
    return await routeEndpoint.getHandleStatesForRoute(routeId);
  }

  @override
  Future<void> addProjectForUser(int routeId, int userId) async {
    try {
      await routeEndpoint.addProjectForUser(routeId, userId);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> deleteProjectForUser(int routeId, int userId) async {
    try {
      await routeEndpoint.deleteProjectForUser(routeId, userId);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> addSentForUser(int routeId, int userId) async {
    try {
      await routeEndpoint.addSentForUser(routeId, userId);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> deleteSentForUser(int routeId, int userId) async {
    try {
      await routeEndpoint.deleteSentForUser(routeId, userId);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<int>> loadProjects(int userId) async {
    try {
      return await routeEndpoint.loadProjects(userId);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<int>> loadSents(int userId) async {
    try {
      return await routeEndpoint.loadSents(userId);
    } on Exception {
      rethrow;
    }
  }
}
