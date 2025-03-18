import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/image_controller_abstract.dart';
import 'package:user_app/domain/spraywall_transformation_controller.dart';
import 'package:user_app/views/spraywall/spraywall_button_builder.dart';
import 'package:user_app/views/spraywall/spraywall_image.dart';

class SpraywallBasePanel extends StatefulWidget {
  final Widget Function(Handle handle) widgetFactory;
  final SpraywallTransformationController transformationController;

  const SpraywallBasePanel(
      {super.key,
      required this.widgetFactory,
      required this.transformationController});

  @override
  State<SpraywallBasePanel> createState() => _SpraywallBasePanelState();
}

class _SpraywallBasePanelState extends State<SpraywallBasePanel> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var imageController =
        Provider.of<ImageControllerAbstract>(context, listen: false);

    // Warte bis das Layout steht, dann berechne die Skalierung (context size needed)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.transformationController.initializeTransformationController(
          context.size!, imageController.imageDimensions!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      transformationController: widget.transformationController,
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
              SpraywallButtonBuilder(widgetFactory: widget.widgetFactory),
            ],
          ),
        ),
      ),
    );
  }
}
