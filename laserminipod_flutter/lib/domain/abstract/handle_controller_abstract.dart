import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/domain/spraywall_transformation_controller.dart';

abstract class HandleControllerAbstract extends ChangeNotifier {
  Offset? get selectedHandlePosition;
  double get selectedHandleDiameter;
  int? get selectedHandleId;

  /// transformation controller for the handle management section
  SpraywallTransformationController get transformationController;

  void setSelectedHandleDiameter(double value);

  void setSelectedHandleId(int? id, BuildContext context);

  void deselectHandle();

  bool isHandleSelected();

  void updateSelectedHandlePosition(Offset delta);

  void setNewHandlePositionToScreenMiddle(BuildContext context);

  Future<void> saveHandle(BuildContext context);

  Future<void> deleteHandle(BuildContext context);

  Future<List<Handle>> loadAllHandles();
}
