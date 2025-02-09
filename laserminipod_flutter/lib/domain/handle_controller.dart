import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/handle_model_abstract.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class HandleController extends ChangeNotifier
    implements HandleControllerAbstract {
  final HandleModelAbstract _handleModel;
  final NavigationControllerAbstract _navigationController;

  Offset? _selectedHandlePosition;
  double _selectedHandleDiameter = 40;
  int? _selectedHandleId;

  HandleController(
      {required HandleModelAbstract handleModel,
      required NavigationControllerAbstract navigationController})
      : _handleModel = handleModel,
        _navigationController = navigationController;

  @override
  Offset? get selectedHandlePosition => _selectedHandlePosition;

  @override
  double get selectedHandleDiameter => _selectedHandleDiameter;

  @override
  int? get selectedHandleId => _selectedHandleId;

  @override
  void setSelectedHandleId(int? id, BuildContext context) {
    _selectedHandleId = id;
    Handle? handle = _handleModel.getHandleById(id!);
    _selectedHandleDiameter = handle!.radius.toDouble();
    _selectedHandlePosition = Offset(handle.x.toDouble(), handle.y.toDouble());
    if (context.mounted) {
      _navigationController.switchToHandleManagementEdit(context,
          selectedHandle: id);
    }
    notifyListeners();
  }

  @override
  void setSelectedHandleDiameter(double value) {
    _selectedHandleDiameter = value;
    notifyListeners();
  }

  @override
  void updateSelectedHandlePosition(Offset delta) {
    // TODO: Boundaries einbauen
    _selectedHandlePosition = _selectedHandlePosition! + delta;
    notifyListeners();
  }

  @override
  void setSelectedHandleToMiddle(BuildContext context) {
    // TODO: Auf Mitte des Bildschirms setzen
    final size = MediaQuery.of(context).size;
    _selectedHandlePosition = Offset(500, 500); //size.width, size.height);
  }

  @override
  Future<bool> saveNewHandle(BuildContext context) async {
    if (selectedHandlePosition == null) {
      throw Exception('Handle position or diameter is null');
    }
    bool success = false;

    try {
      if (_selectedHandleId == null) {
        success = await _handleModel.addHandle(
          selectedHandlePosition!.dx.toInt(),
          selectedHandlePosition!.dy.toInt(),
          selectedHandleDiameter.toInt(),
        );
      } else {
        success = await _handleModel.editHandle(
            selectedHandleId!,
            _selectedHandlePosition!.dx.toInt(),
            _selectedHandlePosition!.dy.toInt(),
            _selectedHandleDiameter.toInt());
      }
    } on Exception {
      UiHelper.showErrorSnackbar("Fehler beim Speichern");
    }

    deselectHandle();

    if (context.mounted) {
      _navigationController.switchToHandleManagementOverview(context);
    }
    return success;
  }

  @override
  void deselectHandle() {
    _selectedHandleId = null;
  }

  @override
  Future<List<Handle>> loadAllHandles() async {
    return await _handleModel.loadAllHandles();
  }
}
