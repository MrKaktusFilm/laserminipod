import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/common/enums/handle_state_enum.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
import 'package:user_app/domain/abstract/filter_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/routes.dart';
import 'package:user_app/views/dialogs/delete_route_dialog.dart';
import 'package:user_app/views/dialogs/save_route_dialog.dart';

class RouteController extends ChangeNotifier
    implements RouteControllerAbstract {
  final RouteModelAbstract routeModel;
  final SprayWallControllerAbstract spraywallController;
  final UserControllerAbstract userController;
  final NavigationControllerAbstract navigationController;
  final FilterControllerAbstract filterController;
  bool _existsNameAlready = false;
  bool _isLoading = false;
  String _name = "";
  String? _nameErrorMessage;
  int _routeListTabIndex = 0;
  List<int> _projects = [];

  RouteController(
      {required this.navigationController,
      required this.routeModel,
      required this.spraywallController,
      required this.userController,
      required this.filterController});

  @override
  int get routeListTabIndex => _routeListTabIndex;

  @override
  bool get isLoading => _isLoading;

  @override
  void setTabIndex(BuildContext context, int index) {
    if (index != _routeListTabIndex) {
      _routeListTabIndex = index;
      switch (index) {
        case 0:
          navigationController.goToPage(AppRoute.myprojects);
          break;
        case 1:
          navigationController.goToPage(AppRoute.myroutes);
          break;
        case 2:
          navigationController.goToPage(AppRoute.allroutes);
          break;
      }
      notifyListeners();
    }
  }

  @override
  void saveCurrentRoute(String? description, int difficulty) async {
    _isLoading = true;
    notifyListeners();
    try {
      final savable = await _isCurrentRouteSavable();
      if (!savable) {
        return;
      }

      var handleStates =
          _convertHandleMap(spraywallController.getCurrentRoute());

      final success = await routeModel.saveRoute(SpraywallRoute(
          name: _name.trim(),
          difficulty: difficulty,
          description: description,
          routeHandleStates: handleStates,
          userInfoId: userController.getSignedInUserId()!));
      if (success) {
        UiHelper.showSnackbar(
            UiHelper.getAppLocalization().routeSaved, Colors.green);
      } else {
        UiHelper.showSnackbar(
            UiHelper.getAppLocalization().routeSaveError, Colors.red);
      }
    } catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().routeSaveError, e as Exception);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void updateNameStatus(String input) async {
    _name = input.trim();
    try {
      _existsNameAlready = await nameAlreadyAssigned(_name);
      _nameErrorMessage = _existsNameAlready
          ? UiHelper.getAppLocalization().routeNameTaken
          : null;
    } catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().error, e as Exception);
    }
    notifyListeners();
  }

  @override
  String? validateRouteName(String? input) {
    if (input == null || input.isEmpty || input.trim().isEmpty) {
      return UiHelper.getAppLocalization().routeNameEmpty;
    }
    return _nameErrorMessage;
  }

  @override
  void openSaveRouteDialog() async {
    try {
      bool savable = await _isCurrentRouteSavable();
      if (savable) {
        UiHelper.showWidgetDialog(const SaveRouteDialog());
      }
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar(UiHelper.getAppLocalization().error, e);
    }
  }

  @override
  void openDeleteRouteDialog(int routeID) {
    UiHelper.showWidgetDialog(DeleteRouteDialog(id: routeID));
  }

  @override
  List<SpraywallRoute> getAllRoutesFiltered() {
    try {
      return filterController.applyFiltersAndSorting(routeModel.allRoutes);
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().routeLoadError, e);
    }
    return [];
  }

  @override
  List<SpraywallRoute> getMyRoutes() {
    int userId = userController.getSignedInUserId()!;
    return getAllRoutesFiltered()
        .where((route) => route.userInfoId == userId)
        .toList();
  }

  @override
  Future<void> deleteRoute(int id) async {
    try {
      await routeModel.deleteRoute(id);
      _projects.remove(id);
      notifyListeners();
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().routeDeleteError, e);
    }
    await loadRouteInfo();
  }

  Future<bool> _existsCurrentRouteAlready() async {
    var handleStates = spraywallController.getCurrentRoute();
    if (handleStates.isEmpty) {
      UiHelper.showSnackbar(
          UiHelper.getAppLocalization().routeEmpty, Colors.red);
      return true;
    }

    Map<int, int> handleStatesInt = {};
    handleStates.forEach((id, state) {
      handleStatesInt[id] = state.value;
    });
    try {
      return routeModel.existsRouteAlready(handleStatesInt);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> _isCurrentRouteSavable() async {
    var handleStates = spraywallController.getCurrentRoute();
    if (handleStates.isEmpty) {
      UiHelper.showSnackbar(
          UiHelper.getAppLocalization().routeEmpty, Colors.red);
      return false;
    }
    bool exists = await _existsCurrentRouteAlready();
    if (exists) {
      UiHelper.showSnackbar(
          UiHelper.getAppLocalization().routeExists, Colors.red);
      return false;
    }
    return true;
  }

  @override
  Future<bool> nameAlreadyAssigned(String name) async {
    return routeModel.nameAlreadyAssigned(name);
  }

  /// load all data for routes, projects, sents and likes into cache from db
  @override
  Future<bool> loadRouteInfo() async {
    try {
      await routeModel.loadAllRoutes();
      if (userController.isSignedIn()) {
        int userId = userController.getSignedInUserId()!;
        _projects = await routeModel.loadProjects(userId);
        await routeModel.loadSents();
        routeModel.loadLikesForUser(userId);
      }
      return true;
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().routeLoadError, e);
    }
    return false;
  }

  @override
  String? tabRedirect(BuildContext context, GoRouterState state) {
    if (!userController.isSignedIn()) return null;
    if (_routeListTabIndex == 1) return AppRoute.myroutes.fullPath;
    if (_routeListTabIndex == 2) return AppRoute.allroutes.fullPath;
    return null;
  }

  List<RouteHandleState> _convertHandleMap(
      Map<int, HandleStateEnum> handleMap) {
    List<RouteHandleState> handleStates = [];
    handleMap.forEach((id, state) => handleStates
        .add(RouteHandleState(routeId: -1, handleId: id, state: state.value)));
    return handleStates;
  }

  @override
  String? get nameErrorMessage => _nameErrorMessage;

  @override
  Future<void> displayRoute(int routeId) async {
    try {
      Map<int, int> mapInts = await routeModel.getHandleStatesForRoute(routeId);
      Map<int, HandleStateEnum> mapStates = {};
      mapInts.forEach(
          (id, state) => mapStates[id] = HandleStateEnum.fromValue(state)!);
      spraywallController.displayRoute(mapStates);
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().routeLoadError, e);
    }
  }

  @override
  Future<void> addProjectForUser(int routeId) async {
    try {
      int userId = userController.getSignedInUserId()!;
      await routeModel.addProjectForUser(routeId, userId);
      _projects.add(routeId);
      UiHelper.showSnackbar(
          UiHelper.getAppLocalization().projectAdded, Colors.green);
      notifyListeners();
    } catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().error, e as Exception);
    }
  }

  @override
  Future<void> deleteProjectForUser(int routeId) async {
    try {
      int userId = userController.getSignedInUserId()!;
      await routeModel.deleteProjectForUser(routeId, userId);
      _projects.remove(routeId);
      notifyListeners();
    } catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().error, e as Exception);
    }
  }

  @override
  Future<void> addSentForUser(int routeId) async {
    try {
      int userId = userController.getSignedInUserId()!;
      await routeModel.addSentForUser(routeId, userId);
      notifyListeners();
    } catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().error, e as Exception);
    }
  }

  @override
  Future<void> deleteSentForUser(int routeId) async {
    try {
      int userId = userController.getSignedInUserId()!;
      await routeModel.deleteSentForUser(routeId, userId);
      notifyListeners();
    } catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().error, e as Exception);
    }
  }

  @override
  List<SpraywallRoute> getMyProjects() {
    return getAllRoutesFiltered()
        .where((route) => _projects.contains(route.id))
        .toList();
  }

  @override
  bool isSent(int routeId) {
    return routeModel.isSent(routeId, userController.getSignedInUserId()!);
  }

  @override
  Future<int> getLikeCount(int routeId) async {
    var likeCounts = await routeModel.loadLikeCounts();
    if (likeCounts.containsKey(routeId)) {
      return likeCounts[routeId]!;
    }
    return 0;
    // if (routeModel.getLikeCounts().containsKey(routeId)) {
    //   return routeModel.getLikeCounts()[routeId]!;
    // }
    // return 0;
  }

  @override
  bool isLiked(int routeId) {
    return routeModel.getLikesForLoggedInUser().contains(routeId);
  }

  @override
  Future<void> toggleLike(int routeId) async {
    try {
      int userId = userController.getSignedInUserId()!;
      await routeModel.toggleLikeForUser(routeId, userId);
      notifyListeners();
    } catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().error, e as Exception);
    }
  }
}
