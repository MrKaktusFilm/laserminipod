import 'package:flutter/material.dart';

abstract class ImageControllerAbstract extends ChangeNotifier {
  Size? get imageDimensions;

  String getImagePath();

  Future<void> loadImageDimensions();
}
