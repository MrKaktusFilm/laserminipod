import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/views/spraywall/spraywall_button_builder.dart';

class SpraywallBasePanel extends StatelessWidget {
  final TransformationController transformationController;
  final Widget Function(Handle handle) widgetFactory;

  const SpraywallBasePanel(
      {super.key,
      required this.transformationController,
      required this.widgetFactory});

  @override
  Widget build(BuildContext context) {
    var spraywallImagePath = 'assets/img/spraywall_example.jpg';

    return InteractiveViewer(
      transformationController: transformationController,
      constrained: false,
      boundaryMargin: EdgeInsets.all(double.infinity),
      minScale: 0.2,
      maxScale: 10.0,
      child: LimitedBox(
        child: Container(
          color: Colors.black,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              Image.asset(
                spraywallImagePath,
                fit: BoxFit.fitHeight,
              ),
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
