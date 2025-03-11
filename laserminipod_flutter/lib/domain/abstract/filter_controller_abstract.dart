import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/domain/filter_controller.dart';

typedef RouteFilter = bool Function(SpraywallRoute route);

abstract class FilterControllerAbstract extends ChangeNotifier {
  List<SpraywallRoute> applyFilters(List<SpraywallRoute> routes);

  void setFilter(FilterName name, dynamic value);

  dynamic getFilterValue(FilterName name);
}
