import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/image_controller_abstract.dart';
import 'package:user_app/views/spraywall/spraywall_button_builder.dart';
import 'package:user_app/views/spraywall/spraywall_image.dart';

class SpraywallBasePanel extends StatelessWidget {
  final TransformationController transformationController;
  final Widget Function(Handle handle) widgetFactory;

  const SpraywallBasePanel(
      {super.key,
      required this.transformationController,
      required this.widgetFactory});

  @override
  Widget build(BuildContext context) {
    var spraywallImagePath =
        Provider.of<ImageControllerAbstract>(context, listen: false)
            .getImagePath();

    return InteractiveViewer(
      transformationController: transformationController,
      constrained: false,
      boundaryMargin: EdgeInsets.zero,
      minScale: 0.2,
      maxScale: 10.0,
      child: LimitedBox(
        child: Container(
          color: Colors.black,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              SpraywallImage(),
              // TODO: imagepath parameter entfernen
              SpraywallButtonBuilder(
                  spraywallImagePath: spraywallImagePath,
                  widgetFactory: widgetFactory),
            ],
          ),
        ),
      ),
    );
  }
}
