import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/views/dialogs/delete_route_dialog.dart';
import 'package:user_app/views/dialogs/save_route_dialog.dart';

class RouteContoller extends ChangeNotifier implements RouteControllerAbstract {
  final RouteModelAbstract routeModel;
  final SprayWallControllerAbstract spraywallController;
  bool _existsNameAlready = false;
  String _name = "";
  String? _nameErrorMessage;

  RouteContoller({required this.routeModel, required this.spraywallController});

  @override
  void saveCurrentRoute() async {
    try {
      // check if route already exists
      notifyListeners();
      final exists = await existsCurrentRouteAlready();
      notifyListeners();
      if (exists) {
        UiHelper.showSnackbar("Die Route existiert bereits.", Colors.red);
        return;
      }

      // save rout
      var currentRoute = spraywallController.getCurrentRoute();
      currentRoute.name = _name.trim();
      notifyListeners();
      final success = await routeModel.saveRoute(currentRoute);
      notifyListeners();

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
      routes = await routeModel.loadAllRoutes();
    } on Exception catch (e, stackTrace) {
      UiHelper.showSnackbar(
          "There was an error loading the routes: $e", Colors.red);
      print('Fehler: $e');
      print('Stacktrace: $stackTrace');
    }
    return routes;
  }

  @override
  Future<void> deleteRoute(int id) async {
    await routeModel.deleteRoute(id);
    notifyListeners();
  }

  @override
  Future<bool> existsCurrentRouteAlready() async {
    return routeModel.existsRouteAlready(spraywallController.getCurrentRoute());
  }

  @override
  Future<bool> nameAlreadyAssigned(String name) async {
    return routeModel.nameAlreadyAssigned(name);
  }

  @override
  String? get nameErrorMessage => _nameErrorMessage;
}
