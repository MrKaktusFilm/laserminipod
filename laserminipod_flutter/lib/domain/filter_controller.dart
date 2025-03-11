import 'package:flutter/material.dart';
import 'package:laserminipod_client/src/protocol/spraywall_route.dart';
import 'package:user_app/domain/abstract/filter_controller_abstract.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';

class FilterController extends ChangeNotifier
    implements FilterControllerAbstract {
  final List<FilterType> _filters = [];

  FilterController() {
    _initFilters();
  }

  @override
  void setFilter(FilterName name, dynamic value) {
    _filters.firstWhere((filterType) => filterType.name == name).filterValue =
        value;
    // _activeFilters.removeWhere((filterType) => filterType.name == name);
    // if (value != null) {
    //   _activeFilters.add(FilterType(name, value));
    // }
    notifyListeners();
  }

  @override
  dynamic getFilterValue(FilterName name) {
    return _filters
        .firstWhere((filterType) => filterType.name == name)
        .filterValue;
  }

  @override
  List<SpraywallRoute> applyFilters(List<SpraywallRoute> routes) {
    var activeFilters =
        _filters.where((filterType) => filterType.filterValue != null);
    return routes
        .where((route) =>
            activeFilters.every((filterType) => _getFilter(filterType)(route)))
        .toList();
  }

  // returns Filter function for given type, ready to be applied to a routeList
  RouteFilter _getFilter(FilterType filterType) {
    FilterName name = filterType.name;
    dynamic value = filterType.filterValue;

    switch (name) {
      case FilterName.sent:
        return Filters.instance.sentFilter(value as bool);
      case FilterName.routeName:
        return Filters.instance.routeNameFilter(value as String);
      case FilterName.creator:
        return Filters.instance.creatorFilter(value as int);
      default:
        throw UnimplementedError('Filter not implemented for $name');
    }
  }

  void _initFilters() {
    for (var filterName in FilterName.values) {
      _filters.add(FilterType(filterName));
    }
  }
}

/// holds logic for applying filters to routes
class Filters {
  final RouteControllerAbstract _routeController;
  static late final Filters _this;

  static Filters get instance => _this;

  Filters({required RouteControllerAbstract routeController})
      : _routeController = routeController {
    _this = this;
  }

  RouteFilter sentFilter(bool sent) {
    return (route) => _routeController.isSent(route.id!) == sent;
  }

  RouteFilter routeNameFilter(String name) {
    return (route) => route.name.contains(name);
  }

  RouteFilter creatorFilter(int userId) {
    return (route) => route.userInfoId == userId;
  }
}

enum FilterName {
  sent("sentFilter"),
  routeName("routeNameFilter"),
  creator("creatorFilter");

  final String name;

  const FilterName(this.name);
}

/// saves currently selected value for the named filter
class FilterType<T> {
  final FilterName name;
  T? filterValue;

  FilterType(this.name);
}
