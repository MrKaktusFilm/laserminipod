import 'package:flutter/material.dart';
import 'package:user_app/common/entities/route.dart';

abstract class RoutelistControllerAbstract extends ChangeNotifier {
  Future<List<SpraywallRoute>> loadAllRoutes();

  List<SpraywallRoute> getAllRoutes();
}
