import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_floating_buttons.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_button.dart';

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

    return Stack(
      children: <Widget>[
        UiHelper.getSpraywallPanel(
          context,
          TransformationController(Matrix4.identity()..scale(0.45)),
          (handle) => SpraywallHandleButton(id: handle.id!),
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
