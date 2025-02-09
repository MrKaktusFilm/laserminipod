import 'package:flutter/material.dart';

abstract class ImageControllerAbstract extends ChangeNotifier {
  (int, int)? get imageDimensions;

  String getImagePath();

  Future<void> loadImageDimensions();
}
