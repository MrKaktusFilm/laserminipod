import 'package:flutter/material.dart';
import 'package:user_app/common/entities/route.dart';

abstract class RoutelistControllerAbstract extends ChangeNotifier {
  List<SpraywallRoute> loadAllRoutes();
}
