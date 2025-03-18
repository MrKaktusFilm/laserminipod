import 'package:flutter/material.dart';
import 'package:user_app/common/enums/handle_state_enum.dart';
import 'package:user_app/domain/spraywall_transformation_controller.dart';

abstract class SprayWallControllerAbstract extends ChangeNotifier {
  /// return new activation state of given handle
  HandleStateEnum toggleHandle(int id);

  void clearCurrentRoute();

  Map<int, HandleStateEnum> getCurrentRoute();

  void displayRoute(Map<int, HandleStateEnum> route);

  HandleStateEnum getHandleStatus(int id);

  /// transformation controller for the home screen
  SpraywallTransformationController get transformationController;
}
