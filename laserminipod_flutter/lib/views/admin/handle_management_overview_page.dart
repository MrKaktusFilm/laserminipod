import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_button.dart';
import 'package:user_app/views/spraywall/spraywall_base_panel.dart';

class HandleManagementOverviewPage extends StatefulWidget {
  const HandleManagementOverviewPage({super.key});

  @override
  State<HandleManagementOverviewPage> createState() =>
      _HandleManagementOverviewPageState();
}

class _HandleManagementOverviewPageState
    extends State<HandleManagementOverviewPage> {
  double handleDiameter = 50.0;
  final GlobalKey spraywallKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final TransformationController transformationController =
        Provider.of<SprayWallControllerAbstract>(context, listen: false)
            .getSpraywallTransformationController();
    final navigationController =
        Provider.of<NavigationControllerAbstract>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handle Management'),
      ),
      body: Stack(
        children: [
          Container(
            key: spraywallKey,
            child: SpraywallBasePanel(
              transformationController: transformationController,
              widgetFactory: (handle) => SpraywallHandleButton(
                id: handle.id!,
                handleDiameter: handle.radius.toDouble(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                // TODO: transformationController fixen
                navigationController.switchToHandleManagementEdit(context,
                    startTransformation: transformationController);
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
