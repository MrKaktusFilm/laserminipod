import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/image_controller_abstract.dart';

class SpraywallImage extends StatelessWidget {
  const SpraywallImage({super.key});

  @override
  Widget build(BuildContext context) {
    var spraywallImagePath =
        Provider.of<ImageControllerAbstract>(context, listen: false)
            .getImagePath();

    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Colors.grey.withOpacity(0.5), // Verringert die Farbsättigung
        BlendMode.saturation,
      ),
      child: Image.asset(
        spraywallImagePath,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
