import 'package:flutter/material.dart';
import 'package:laserminipod_client/src/protocol/spraywall_route.dart';
import 'package:user_app/domain/abstract/filter_controller_abstract.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';

class FilterController extends ChangeNotifier
    implements FilterControllerAbstract {
  final List<FilterType> _filters = [];
  SortationName _sortation = SortationName.alphabetical;

  FilterController() {
    _initFilters();
  }

  @override
  void setFilter(FilterName name, dynamic value) {
    _filters.firstWhere((filterType) => filterType.name == name).filterValue =
        value;
    notifyListeners();
  }

  @override
  dynamic getFilterValue(FilterName name) {
    return _filters
        .firstWhere((filterType) => filterType.name == name)
        .filterValue;
  }

  List<SpraywallRoute> _applyFilters(List<SpraywallRoute> routes) {
    var activeFilters =
        _filters.where((filterType) => filterType.filterValue != null);
    return routes
        .where((route) =>
            activeFilters.every((filterType) => _getFilter(filterType)(route)))
        .toList();
  }

  @override
  void resetFilters() {
    for (var filterType in _filters) {
      filterType.filterValue = null;
    }
    notifyListeners();
  }

  @override
  bool isFilterActive(FilterName name) {
    return _filters.firstWhere((filter) => filter.name == name).filterValue !=
        null;
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
      case FilterName.minDifficulty:
        return Filters.instance.minDifficultyFilter(value as int);
      case FilterName.maxDifficulty:
        return Filters.instance.maxDifficultyFilter(value as int);
      default:
        throw UnimplementedError('Filter not implemented for $name');
    }
  }

  void _initFilters() {
    for (var filterName in FilterName.values) {
      _filters.add(FilterType(filterName));
    }
  }

  RouteComperator _getSortation(SortationName sortation) {
    switch (sortation) {
      case SortationName.alphabetical:
        return (a, b) =>
            a.name.trim().toUpperCase().compareTo(b.name.trim().toUpperCase());
      case SortationName.newest:
        return (a, b) => b.creationDate.compareTo(a.creationDate);
      case SortationName.oldest:
        return (a, b) => a.creationDate.compareTo(b.creationDate);
      case SortationName.hardest:
        return (a, b) => b.difficulty.compareTo(a.difficulty);
      case SortationName.easiest:
        return (a, b) => a.difficulty.compareTo(b.difficulty);
      case SortationName.mostSents:
      // return (a, b) => b.sentCount.compareTo(a.sentCount);
      case SortationName.leastSents:
      // return (a, b) => a.sentCount.compareTo(b.sentCount);
      default:
        throw UnimplementedError('Sortation not implemented for $sortation');
    }
  }

  @override
  List<SpraywallRoute> applyFiltersAndSorting(List<SpraywallRoute> routes) {
    var filteredRoutes = _applyFilters(routes);
    return filteredRoutes..sort(_getSortation(_sortation));
  }

  @override
  SortationName get sortation => _sortation;

  @override
  void setSortation(SortationName sortation) {
    _sortation = sortation;
    notifyListeners();
  }
}

/// holds logic for applying filters to routes
class Filters {
  // TODO: Integrate into controller, use routeModel
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

  RouteFilter minDifficultyFilter(int difficulty) {
    return (route) => route.difficulty >= difficulty;
  }

  RouteFilter maxDifficultyFilter(int difficulty) {
    return (route) => route.difficulty <= difficulty;
  }
}

enum FilterName {
  sent("sentFilter"),
  routeName("routeNameFilter"),
  creator("creatorFilter"),
  minDifficulty("minDifficultyFilter"),
  maxDifficulty("maxDifficultyFilter");

  final String name;

  const FilterName(this.name);
}

/// saves currently selected value for the named filter
class FilterType<T> {
  final FilterName name;
  T? filterValue;

  FilterType(this.name);
}

enum SortationName {
  alphabetical(0),
  newest(1),
  oldest(2),
  hardest(3),
  easiest(4),
  mostSents(5),
  leastSents(6);

  final int value;

  const SortationName(this.value);

  String getName() {
    switch (this) {
      case SortationName.alphabetical:
        return 'Alphabetical';
      case SortationName.newest:
        return 'Newest first';
      case SortationName.oldest:
        return 'Oldest first';
      case SortationName.hardest:
        return 'Hardest first';
      case SortationName.easiest:
        return 'Easiest first';
      case SortationName.mostSents:
        return 'Most sents first';
      case SortationName.leastSents:
        return 'Least sents first';
    }
  }
}
