import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';

class RouteModel extends RouteModelAbstract {
  var _routes = <SpraywallRoute>[];
  var _sents = <RouteUserSents>[];
  List<int> _likes = [];
  int idIndex = 0;
  late EndpointRoute routeEndpoint;

  @override
  Future<void> deleteRoute(int id) async {
    try {
      await routeEndpoint.deleteRoute(id);
      _routes.removeWhere((route) => route.id == id);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> saveRoute(SpraywallRoute route) async {
    try {
      bool success = await routeEndpoint.saveRoute(route.copyWith());
      if (success) {
        _routes.add(route);
      }
      return success;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<SpraywallRoute>> loadAllRoutes() async {
    try {
      _routes = await routeEndpoint.loadAllRoutes();
      return _routes;
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
      _sents.add(RouteUserSents(routeId: routeId, userId: userId));
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> deleteSentForUser(int routeId, int userId) async {
    try {
      await routeEndpoint.deleteSentForUser(routeId, userId);
      _sents.removeWhere(
          (sent) => sent.routeId == routeId && sent.userId == userId);
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
  Future<List<RouteUserSents>> loadSents() async {
    try {
      _sents = await routeEndpoint.loadSents();
      return _sents;
    } on Exception {
      rethrow;
    }
  }

  @override
  List<SpraywallRoute> get allRoutes => _routes;

  @override
  List<RouteUserSents> get allSents => _sents;

  @override
  bool isSent(int routeId, int userId) {
    return _sents
        .any((sent) => sent.routeId == routeId && sent.userId == userId);
  }

  @override
  List<int> getLikesForLoggedInUser() {
    return _likes;
  }

  @override
  Future<void> toggleLikeForUser(int routeId, int userId) async {
    await routeEndpoint.toggleLikeForUser(routeId, userId);
    if (_likes.contains(routeId)) {
      _likes.remove(routeId);
    } else {
      _likes.add(routeId);
    }
  }

  @override
  Future<void> loadLikesForUser(int userId) async {
    _likes = await routeEndpoint.getLikesForUser(userId);
  }

  @override
  Future<Map<int, int>> loadLikeCounts() async {
    Map<int, int> likeCounts = {};
    var likes = await routeEndpoint.getAllLikes();
    for (var like in likes) {
      likeCounts.update(like.routeId, (value) => value + 1, ifAbsent: () => 1);
    }
    return likeCounts;
  }

  @override
  void initialize(Client client) {
    routeEndpoint = client.route;
  }
}
