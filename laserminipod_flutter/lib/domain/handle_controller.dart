import 'package:flutter/material.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';

class HandleController extends ChangeNotifier
    implements HandleControllerAbstract {
  Offset? _selectedHandlePosition;
  double _selectedHandleDiameter = 40;

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
}
