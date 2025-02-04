import 'package:flutter/material.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';

class HandleController extends ChangeNotifier
    implements HandleControllerAbstract {
  Offset? _selectedHandlePosition;

  @override
  Offset? get selectedHandlePosition => _selectedHandlePosition;

  @override
  void updateSelectedHandlePosition(Offset delta) {
    _selectedHandlePosition = _selectedHandlePosition! + delta;
    notifyListeners();
  }

  @override
  void setSelectedHandleToMiddle(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _selectedHandlePosition = Offset(size.width, size.height);
  }
}
