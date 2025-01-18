import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';

class SpraywallController extends ChangeNotifier
    implements SprayWallControllerAbstract {
  final RouteModelAbstract routeModel;

  SpraywallRoute currentRoute =
      SpraywallRoute(handles: <int>[], id: 0, name: "");
  bool _isLoading = false;
  bool _existsRouteAlready = false;
  bool _existsNameAlready = false;
  String? _nameErrorMessage;
  String _name = "";

  SpraywallController({required this.routeModel});

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
  void saveCurrentRoute(BuildContext context) async {
    try {
      // Prüfen, ob die Route existiert
      _isLoading = true;
      final exists = await existsCurrentRouteAlready();
      _isLoading = false;
      if (exists) {
        _showSnackbar(context, "Die Route existiert bereits.", Colors.red);
        return;
      }

      // Name der Route setzen und speichern
      currentRoute.name = _name.trim();
      _isLoading = true;
      final success = await routeModel.saveRoute(currentRoute);
      _isLoading = false;

      if (success) {
        _showSnackbar(context, "Route erfolgreich gespeichert.", Colors.green);
      } else {
        _showSnackbar(context, "Fehler beim Speichern der Route.", Colors.red);
      }

      notifyListeners();
    } catch (e) {
      _showSnackbar(
          context, "Ein Fehler ist aufgetreten: ${e.toString()}", Colors.red);
    }
  }

  @override
  void updateNameStatus(String input, BuildContext context) async {
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
  void deleteRoute(int id) {
    routeModel.deleteRoute(id);
    notifyListeners();
  }

  @override
  void loadRoute(SpraywallRoute route) {
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

  void _showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
