import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_floating_buttons.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_button.dart';
import 'package:user_app/views/spraywall/spraywall_base_panel.dart';

class SpraywallPage extends StatefulWidget {
  const SpraywallPage({super.key});

  @override
  State<SpraywallPage> createState() => _SpraywallPageState();
}

class _SpraywallPageState extends State<SpraywallPage> {
  @override
  Widget build(BuildContext context) {
    var sprayWallController =
        Provider.of<SprayWallControllerAbstract>(context, listen: false);
    var transformationController =
        Provider.of<HandleControllerAbstract>(context, listen: false)
            .transformationController;

    return Stack(
      children: <Widget>[
        SpraywallBasePanel(
          transformationController: transformationController,
          widgetFactory: (handle) => SpraywallHandleButton(
            id: handle.id!,
            handleDiameter: handle.radius.toDouble(),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              sprayWallController.openSaveRouteDialog();
            },
            child: const Icon(Icons.save),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: SpraywallFloatingButton(
            icon: Icons.delete,
            action: sprayWallController.clearCurrentRoute,
          ),
        ),
      ],
    );
  }
}
