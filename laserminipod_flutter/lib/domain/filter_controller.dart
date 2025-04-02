import 'package:flutter/material.dart';
import 'package:laserminipod_client/src/protocol/spraywall_route.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
import 'package:user_app/domain/abstract/filter_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class FilterController extends ChangeNotifier
    implements FilterControllerAbstract {
  final List<FilterType> _filters = [];
  SortationName _sortation = SortationName.alphabetical;

  final RouteModelAbstract _routeModel;
  final UserControllerAbstract _userController;

  FilterController(this._routeModel, this._userController) {
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
        if (_userController.isSignedIn() == false) {
          return (route) => false;
        }
        return (route) =>
            _routeModel.isSent(
                route.id!, _userController.getSignedInUserId()!) ==
            value;
      case FilterName.routeName:
        return (route) => route.name.contains(value);
      case FilterName.creator:
        return (route) => route.userInfoId == value;
      case FilterName.minDifficulty:
        return (route) => route.difficulty >= value;
      case FilterName.maxDifficulty:
        return (route) => route.difficulty <= value;
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
        return (a, b) => _sentCount(b).compareTo(_sentCount(a));
      case SortationName.leastSents:
        return (a, b) => _sentCount(a).compareTo(_sentCount(b));
    }
  }

  int _sentCount(SpraywallRoute route) {
    return _routeModel.allSents
        .where((sent) => sent.routeId == route.id)
        .length;
  }

  @override
  List<SpraywallRoute> applyFiltersAndSorting(List<SpraywallRoute> routes) {
    // reset sent filters if user is not signed in and sent filter is active
    if (_userController.isSignedIn() == false &&
        isFilterActive(FilterName.sent)) {
      _filters
          .firstWhere((filterType) => filterType.name == FilterName.sent)
          .filterValue = null;
    }

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

  @override
  int getActiveFilterCount() {
    int count = _filters.where((filter) => filter.filterValue != null).length;
    // decrease filter count if sent filter is falsly active for guest user
    if (_userController.isSignedIn() == false &&
        isFilterActive(FilterName.sent)) {
      count--;
    }
    return count;
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
    var loc = UiHelper.getAppLocalization();
    switch (this) {
      case SortationName.alphabetical:
        return loc.alphabetical;
      case SortationName.newest:
        return loc.newest;
      case SortationName.oldest:
        return loc.oldest;
      case SortationName.hardest:
        return loc.hardest;
      case SortationName.easiest:
        return loc.easiest;
      case SortationName.mostSents:
        return loc.mostSents;
      case SortationName.leastSents:
        return loc.leastSents;
    }
  }
}
