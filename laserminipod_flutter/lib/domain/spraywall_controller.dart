import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/route_model_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/main.dart';
import 'package:user_app/views/dialogs/save_route_dialog.dart';

class SpraywallController extends ChangeNotifier
    implements SprayWallControllerAbstract {
  final RouteModelAbstract routeModel;

  SpraywallRoute currentRoute =
      SpraywallRoute(handles: <int>[], id: 0, name: "");
  bool _isLoading = false;
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
      // check if route already exists
      _isLoading = true;
      final exists = await existsCurrentRouteAlready();
      _isLoading = false;
      if (exists) {
        _showSnackbar("Die Route existiert bereits.", Colors.red);
        return;
      }

      // save route
      currentRoute.name = _name.trim();
      _isLoading = true;
      final success = await routeModel.saveRoute(currentRoute);
      _isLoading = false;

      if (success) {
        _showSnackbar("Route erfolgreich gespeichert.", Colors.green);
      } else {
        _showSnackbar("Fehler beim Speichern der Route.", Colors.red);
      }

      notifyListeners();
    } catch (e) {
      _showSnackbar("Ein Fehler ist aufgetreten: ${e.toString()}", Colors.red);
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
  void openSaveRouteDialog(BuildContext context) async {
    bool existsRouteAlready = await existsCurrentRouteAlready();
    if (existsRouteAlready) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Die erstellte Route existiert bereits."),
      ));
      _showSnackbar("Die erstellte Route existiert bereits.", Colors.red);
    } else {
      _showDialog(const SaveRouteDialog());
    }
  }

  @override
  Future<List<SpraywallRoute>> loadAllRoutes() async {
    try {
      return routeModel.loadAllRoutes();
    } on Exception {
      rethrow;
    }
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

  void _showSnackbar(String message, Color color) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  void _showDialog(Widget dialog) {
    final context = navigatorKey.currentState?.overlay?.context;
    showDialog(
      context: context!,
      builder: (BuildContext context) => dialog,
    );
  }
}
