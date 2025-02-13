import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_edit_selected_button.dart';
import 'package:user_app/views/spraywall/spraywall_button_builder.dart';
import 'package:user_app/views/spraywall/spraywall_image.dart';

class SpraywallEditPanel extends StatefulWidget {
  final TransformationController transformationController;
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
    var handleController =
        Provider.of<HandleControllerAbstract>(context, listen: false);

    // Warte bis das Layout steht, dann berechne die Skalierung (context size needed)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      handleController.initializeTransformationController(context.size!);
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
