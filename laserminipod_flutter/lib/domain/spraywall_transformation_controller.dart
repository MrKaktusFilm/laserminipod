import 'package:flutter/material.dart';

class SpraywallTransformationController extends TransformationController {
  /// start interactive viewer for spraywall at max zoom
  void initializeTransformationController(Size containerSize, Size imageSize) {
    if (value != Matrix4.identity()) {
      return;
    }
    double scaleX = containerSize.width / imageSize.width;
    double scaleY = containerSize.height / imageSize.height;
    double initialScale = scaleX > scaleY ? scaleX : scaleY;

    value = Matrix4.identity()..scale(initialScale);
    notifyListeners();
  }
}
