import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/image_controller_abstract.dart';
import 'package:user_app/domain/spraywall_transformation_controller.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_edit_selected_button.dart';
import 'package:user_app/views/spraywall/spraywall_button_builder.dart';
import 'package:user_app/views/spraywall/spraywall_image.dart';

class SpraywallEditPanel extends StatefulWidget {
  final SpraywallTransformationController transformationController;
  final Widget Function(Handle handle) widgetFactory;

  const SpraywallEditPanel(
      {super.key,
      required this.transformationController,
      required this.widgetFactory});

  @override
  State<SpraywallEditPanel> createState() => _SpraywallEditPanelState();
}

class _SpraywallEditPanelState extends State<SpraywallEditPanel> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Warte bis das Layout steht, dann berechne die Skalierung (context size needed)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var imageController =
          Provider.of<ImageControllerAbstract>(context, listen: false);

      // Warte bis das Layout steht, dann berechne die Skalierung (context size needed)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.transformationController.initializeTransformationController(
            context.size!, imageController.imageDimensions!);
      });
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
              SpraywallHandleEditSelectedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
