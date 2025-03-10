import 'package:flutter/material.dart';
import 'package:laserminipod_client/src/protocol/spraywall_route.dart';
import 'package:user_app/domain/abstract/filter_controller_abstract.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';

class FilterController extends ChangeNotifier
    implements FilterControllerAbstract {
  final List<FilterType> _activeFilters = [];

  @override
  void setFilter(FilterName name, dynamic value) {
    _activeFilters.removeWhere((filterType) => filterType.name == name);
    if (value != null) {
      _activeFilters.add(FilterType(name, value));
    }
    notifyListeners();
  }

  @override
  List<SpraywallRoute> applyFilters(List<SpraywallRoute> routes) {
    return routes
        .where((route) =>
            _activeFilters.every((filterType) => _getFilter(filterType)(route)))
        .toList();
  }

  RouteFilter _getFilter(FilterType filterType) {
    FilterName name = filterType.name;
    dynamic value = filterType.filterValue;

    switch (name) {
      case FilterName.sent:
        return Filters.instance.sentFilter(value as bool);
      // Add more cases here for other filters
      default:
        throw UnimplementedError('Filter not implemented for $name');
    }
  }
}

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
}

enum FilterName {
  sent("sentFilter");

  final String name;

  const FilterName(this.name);
}

class FilterType<T> {
  final FilterName name;
  final T? _filterValue;

  FilterType(this.name, this._filterValue);

  T? get filterValue => _filterValue;
}
