import 'package:flutter/material.dart';

abstract class HandleControllerAbstract extends ChangeNotifier {
  Offset? get selectedHandlePosition;

  void updateSelectedHandlePosition(Offset delta);

  void setSelectedHandleToMiddle(BuildContext context);
}
