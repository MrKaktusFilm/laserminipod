import 'package:flutter/material.dart';
import 'package:user_app/data/abstract/handle_model_abstract.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';

class HandleController extends ChangeNotifier
    implements HandleControllerAbstract {
  final HandleModelAbstract _handleModel;

  Offset? _selectedHandlePosition;
  double _selectedHandleDiameter = 40;

  HandleController({required HandleModelAbstract handleModel})
      : _handleModel = handleModel;

  @override
  Offset? get selectedHandlePosition => _selectedHandlePosition;

  @override
  double get selectedHandleDiameter => _selectedHandleDiameter;

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
  Future<bool> saveNewHandle() async {
    if (selectedHandlePosition == null || selectedHandleDiameter == null) {
      throw Exception('Handle position or diameter is null');
    }

    return await _handleModel.addHandle(
      selectedHandlePosition!.dx.toInt(),
      selectedHandlePosition!.dy.toInt(),
      selectedHandleDiameter!.toInt(),
    );
  }
}
