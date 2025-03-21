import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
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

    var routeController =
        Provider.of<RouteControllerAbstract>(context, listen: false);

    return Consumer<UserControllerAbstract>(
        builder: (context, userController, child) {
      return Stack(
        children: <Widget>[
          SpraywallBasePanel(
            widgetFactory: (handle) => SpraywallHandleButton(
              id: handle.id!,
              handleDiameter: handle.radius.toDouble(),
            ),
            transformationController:
                sprayWallController.transformationController,
          ),
          if (userController.isSignedIn())
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  routeController.openSaveRouteDialog();
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
    });
  }
}
