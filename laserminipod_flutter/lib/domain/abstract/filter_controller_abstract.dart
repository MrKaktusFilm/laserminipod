import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/domain/filter_controller.dart';

typedef RouteFilter = bool Function(SpraywallRoute route);
typedef RouteComperator = int Function(SpraywallRoute a, SpraywallRoute b);

abstract class FilterControllerAbstract extends ChangeNotifier {
  List<SpraywallRoute> applyFiltersAndSorting(List<SpraywallRoute> routes);

  void setFilter(FilterName name, dynamic value);

  dynamic getFilterValue(FilterName name);

  void resetFilters();

  bool isFilterActive(FilterName name);

  SortationName get sortation;

  void setSortation(SortationName sortation);
}
