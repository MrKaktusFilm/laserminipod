import 'package:flutter/foundation.dart';
import 'package:laserminipod_client/laserminipod_client.dart' as cl;

class SpraywallRoute {
  SpraywallRoute({required this.handles, required this.id, required this.name});

  // contains the handle IDs of the route
  List<int> handles;
  String name;
  final int id;

  addHandle(int id) {
    handles.add(id);
  }

  removeHandle(int id) {
    handles.remove(id);
  }

  clear() {
    handles = [];
  }

  SpraywallRoute copyWith() {
    return SpraywallRoute(handles: List.from(handles), id: id, name: name);
  }

  static SpraywallRoute convert(cl.SpraywallRoute route) {
    return SpraywallRoute(
        handles: List.from(route.handles), id: route.id, name: route.name);
  }

  // routes are considered equal, if they consist of the same handles
  @override
  bool operator ==(Object other) {
    if (other is SpraywallRoute) {
      return listEquals(other.handles, handles);
    }
    return false;
  }
}
