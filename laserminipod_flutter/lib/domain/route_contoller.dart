import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/common/enums/handle_state_enum.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
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
  bool _existsNameAlready = false;
  bool _isLoading = false;
  String _name = "";
  String? _nameErrorMessage;
  int _routeListTabIndex = 0;
  List<SpraywallRoute> allRoutes = [];

  RouteController(
      {required this.navigationController,
      required this.routeModel,
      required this.spraywallController,
      required this.userController});

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
    // TODO: filter deactivated handles
    _isLoading = true;
    notifyListeners();
    try {
      final exists = await existsCurrentRouteAlready();
      if (exists) {
        UiHelper.showSnackbar(
            UiHelper.getAppLocalization().routeExists, Colors.red);
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
    bool existsRouteAlready = await existsCurrentRouteAlready();
    if (existsRouteAlready) {
      UiHelper.showSnackbar(
          UiHelper.getAppLocalization().routeAlreadyCreated, Colors.red);
    } else {
      UiHelper.showWidgetDialog(const SaveRouteDialog());
    }
  }

  @override
  void openDeleteRouteDialog(int routeID) {
    UiHelper.showWidgetDialog(DeleteRouteDialog(id: routeID));
  }

  @override
  List<SpraywallRoute> getAllRoutes() {
    return allRoutes;
  }

  @override
  List<SpraywallRoute> getMyRoutes() {
    int userId = userController.getSignedInUserId()!;
    return allRoutes.where((route) => route.userInfoId == userId).toList();
  }

  @override
  Future<void> deleteRoute(int id) async {
    await routeModel.deleteRoute(id);
    await loadAllRoutes();
    notifyListeners();
  }

  @override
  Future<bool> existsCurrentRouteAlready() async {
    var handleStates = spraywallController.getCurrentRoute();
    Map<int, int> handleStatesInt = {};
    handleStates.forEach((id, state) {
      handleStatesInt[id] = state.value;
    });
    return routeModel.existsRouteAlready(handleStatesInt);
  }

  @override
  Future<bool> nameAlreadyAssigned(String name) async {
    return routeModel.nameAlreadyAssigned(name);
  }

  @override
  Future<bool> loadAllRoutes() async {
    try {
      allRoutes = await routeModel.loadAllRoutes();
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
    Map<int, int> mapInts = await routeModel.getHandleStatesForRoute(routeId);
    Map<int, HandleStateEnum> mapStates = {};
    mapInts.forEach(
        (id, state) => mapStates[id] = HandleStateEnum.fromValue(state)!);
    spraywallController.displayRoute(mapStates);
  }
}
