import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_app/domain/abstract/image_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class ImageController extends ChangeNotifier
    implements ImageControllerAbstract {
  final String _imagePath = 'assets/img/spraywall_example.jpg';
  Size? _imageDimensions;

  @override
  Size? get imageDimensions => _imageDimensions;

  // caches the image dimensions
  @override
  Future<void> loadImageDimensions() async {
    try {
      ByteData data = await rootBundle.load(_imagePath);
      Uint8List bytes = data.buffer.asUint8List();

      // Dekodiere das Bild
      ui.Image decodedImage = await decodeImageFromList(bytes);
      _imageDimensions =
          Size(decodedImage.width.toDouble(), decodedImage.height.toDouble());
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().imageDimensionsError, e);
    }
  }

  @override
  String getImagePath() {
    return _imagePath;
  }
}
