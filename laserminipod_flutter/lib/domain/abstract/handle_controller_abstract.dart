import 'package:flutter/material.dart';

abstract class HandleControllerAbstract extends ChangeNotifier {
  Offset? get selectedHandlePosition;
  double get selectedHandleDiameter;

  void setSelectedHandleDiameter(double value);

  void updateSelectedHandlePosition(Offset delta);

  void setSelectedHandleToMiddle(BuildContext context);
}
