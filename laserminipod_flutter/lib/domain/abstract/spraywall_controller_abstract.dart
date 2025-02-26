import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';

abstract class SprayWallControllerAbstract extends ChangeNotifier {
  /// return new activation state of given handle
  bool toggleHandle(int id);

  void clearCurrentRoute();

  List<int> getCurrentRoute();

  void displayRoute(SpraywallRoute route);

  bool isHandleActivated(int id);
}
