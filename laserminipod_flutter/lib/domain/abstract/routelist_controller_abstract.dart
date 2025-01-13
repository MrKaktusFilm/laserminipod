import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';

abstract class RoutelistControllerAbstract extends ChangeNotifier {
  Future<List<SpraywallRoute>> loadAllRoutes();

  List<SpraywallRoute> getAllRoutes();
}
