import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/domain/abstract/image_controller_abstract.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_button_template.dart';

class SpraywallHandleEditSelectedButton extends StatelessWidget {
  const SpraywallHandleEditSelectedButton({super.key});

  @override
  Widget build(BuildContext context) {
    ImageControllerAbstract imageController =
        Provider.of<ImageControllerAbstract>(context, listen: false);
    final imageDimensions = imageController.imageDimensions;
    return Consumer<HandleControllerAbstract>(
      builder: (context, handleController, child) {
        double handleDiameter = handleController.selectedHandleDiameter;
        return Positioned(
          left: clampDouble(
              handleController.selectedHandlePosition!.dx - handleDiameter / 2,
              -handleDiameter / 2,
              imageDimensions!.$1.toDouble() - handleDiameter / 2),
          top: clampDouble(
              handleController.selectedHandlePosition!.dy - handleDiameter / 2,
              -handleDiameter / 2,
              imageDimensions.$2.toDouble() - handleDiameter / 2),
          child: GestureDetector(
              onPanUpdate: (details) {
                handleController.updateSelectedHandlePosition(details.delta);
              },
              child: SpraywallHandleButtonTemplate(
                  handleDiameter: handleDiameter, color: Colors.blue)),
        );
      },
    );
  }
}
