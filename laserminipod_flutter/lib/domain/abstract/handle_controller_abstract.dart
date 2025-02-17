import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';

abstract class HandleControllerAbstract extends ChangeNotifier {
  Offset? get selectedHandlePosition;
  double get selectedHandleDiameter;
  int? get selectedHandleId;
  TransformationController get transformationController;

  void setSelectedHandleDiameter(double value);

  void setSelectedHandleId(int? id, BuildContext context);

  void deselectHandle();

  bool isHandleSelected();

  void updateSelectedHandlePosition(Offset delta);

  void setNewHandlePositionToScreenMiddle(BuildContext context);

  Future<void> saveHandle(BuildContext context);

  Future<void> deleteHandle(BuildContext context);

  Future<List<Handle>> loadAllHandles();

  void initializeTransformationController(Size containerSize);
}
