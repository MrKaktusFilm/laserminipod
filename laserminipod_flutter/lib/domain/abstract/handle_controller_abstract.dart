import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';

abstract class HandleControllerAbstract extends ChangeNotifier {
  Offset? get selectedHandlePosition;
  double get selectedHandleDiameter;
  int? get selectedHandleId;

  void setSelectedHandleDiameter(double value);

  void setSelectedHandleId(int? id, BuildContext context);

  void deselectHandle();

  void updateSelectedHandlePosition(Offset delta);

  void setSelectedHandleToMiddle(BuildContext context);

  Future<bool> saveNewHandle(BuildContext context);

  Future<List<Handle>> loadAllHandles();
}
