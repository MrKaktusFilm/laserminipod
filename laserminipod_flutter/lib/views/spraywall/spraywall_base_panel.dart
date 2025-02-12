import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/views/spraywall/spraywall_button_builder.dart';
import 'package:user_app/views/spraywall/spraywall_image.dart';

class SpraywallBasePanel extends StatefulWidget {
  final Widget Function(Handle handle) widgetFactory;

  const SpraywallBasePanel({super.key, required this.widgetFactory});

  @override
  State<SpraywallBasePanel> createState() => _SpraywallBasePanelState();
}

class _SpraywallBasePanelState extends State<SpraywallBasePanel> {
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
    final TransformationController transformationController =
        Provider.of<HandleControllerAbstract>(context, listen: false)
            .transformationController;

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
              SpraywallButtonBuilder(widgetFactory: widget.widgetFactory),
            ],
          ),
        ),
      ),
    );
  }
}
