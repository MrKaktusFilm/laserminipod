import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/views/spraywall/spraywall_button_biulder.dart';

class SpraywallEditPanel extends StatelessWidget {
  final TransformationController transformationController;
  final Widget Function(Handle handle) widgetFactory;

  const SpraywallEditPanel(
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
              Consumer<HandleControllerAbstract>(
                builder: (context, handleController, child) {
                  double handleDiameter =
                      handleController.selectedHandleDiameter;
                  return Positioned(
                    left: handleController.selectedHandlePosition!.dx -
                        handleDiameter / 2,
                    top: handleController.selectedHandlePosition!.dy -
                        handleDiameter / 2,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        handleController
                            .updateSelectedHandlePosition(details.delta);
                      },
                      child: Container(
                        width: handleDiameter,
                        height: handleDiameter,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
