import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/handle_model_abstract.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/views/dialogs/delete_route_dialog.dart';
import 'package:user_app/views/dialogs/save_route_dialog.dart';

class SpraywallController extends ChangeNotifier
    implements SprayWallControllerAbstract {
  final RouteModelAbstract routeModel;
  final HandleModelAbstract handleModel;

  SpraywallRoute currentRoute =
      SpraywallRoute(handles: <int>[], id: 0, name: "");
  bool _isLoading = false;
  bool _existsNameAlready = false;
  String? _nameErrorMessage;
  String _name = "";

  SpraywallController({required this.handleModel, required this.routeModel});

  @override
  String? get nameErrorMessage => _nameErrorMessage;

  @override
  void addHandle(int id) {
    currentRoute.handles.add(id);
    notifyListeners();
  }

  @override
  void removeHandle(int id) {
    currentRoute.handles.remove(id);
    notifyListeners();
  }

  @override
  void clearCurrentRoute() {
    currentRoute.handles = [];
    notifyListeners();
  }

  @override
  void saveCurrentRoute() async {
    try {
      // check if route already exists
      _isLoading = true;
      final exists = await existsCurrentRouteAlready();
      _isLoading = false;
      if (exists) {
        UiHelper.showSnackbar("Die Route existiert bereits.", Colors.red);
        return;
      }

      // save route
      currentRoute.name = _name.trim();
      _isLoading = true;
      final success = await routeModel.saveRoute(currentRoute);
      _isLoading = false;

      if (success) {
        UiHelper.showSnackbar("Route erfolgreich gespeichert.", Colors.green);
      } else {
        UiHelper.showSnackbar("Fehler beim Speichern der Route.", Colors.red);
      }

      notifyListeners();
    } catch (e) {
      UiHelper.showSnackbar(
          "Ein Fehler ist aufgetreten: ${e.toString()}", Colors.red);
    }
  }

  @override
  void updateNameStatus(String input) async {
    _name = input.trim();
    try {
      _existsNameAlready = await nameAlreadyAssigned(_name);
      if (_existsNameAlready) {
        _nameErrorMessage = "Eine andere Route hat bereits diesen Namen.";
      } else {
        _nameErrorMessage = null;
      }
    } catch (e) {
      _nameErrorMessage = "Ein Fehler ist aufgetreten.";
    }
    notifyListeners();
  }

  @override
  String? validateRouteName(String? input) {
    if (input == null || input.isEmpty || input.trim().isEmpty) {
      return "Der Name darf nicht leer sein.";
    }
    return _nameErrorMessage;
  }

  @override
  void openSaveRouteDialog() async {
    bool existsRouteAlready = await existsCurrentRouteAlready();
    if (existsRouteAlready) {
      UiHelper.showSnackbar(
          "Die erstellte Route existiert bereits.", Colors.red);
    } else {
      UiHelper.showWidgetDialog(const SaveRouteDialog());
    }
  }

  @override
  void openDeleteRouteDialog(int routeID) {
    UiHelper.showWidgetDialog(DeleteRouteDialog(id: routeID));
  }

  @override
  Future<List<SpraywallRoute>> loadAllRoutes() async {
    var routes;
    try {
      _isLoading = true;
      routes = await routeModel.loadAllRoutes();
    } on Exception {
      UiHelper.showSnackbar(
          "There was an error loading the routes", Colors.red);
    } finally {
      _isLoading = false;
    }
    return routes;
  }

  @override
  Future<List<Handle>> loadAllHandles() async {
    var handles;
    try {
      _isLoading = true;
      handles = await handleModel.loadAllHandles();
    } on Exception {
      UiHelper.showSnackbar(
          "There was an error loading the handles", Colors.red);
    } finally {
      _isLoading = false;
    }
    return handles;
  }

  @override
  Future<void> deleteRoute(int id) async {
    await routeModel.deleteRoute(id);
    notifyListeners();
  }

  /// loads the given route to the spraywall screen panel
  @override
  void displayRoute(SpraywallRoute route) {
    currentRoute = route.copyWith();
    notifyListeners();
  }

  @override
  SpraywallRoute getCurrentRoute() {
    return currentRoute;
  }

  @override
  bool isHandleActivated(int id) {
    return currentRoute.handles.contains(id);
  }

  @override
  Future<bool> existsCurrentRouteAlready() async {
    return routeModel.existsRouteAlready(currentRoute);
  }

  @override
  Future<bool> nameAlreadyAssigned(String name) async {
    return routeModel.nameAlreadyAssigned(name);
  }

  @override
  bool isLoading() {
    return _isLoading;
  }
}
