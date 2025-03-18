import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/spraywall_transformation_controller.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/routes.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_overview_button.dart';
import 'package:user_app/views/spraywall/spraywall_base_panel.dart';

class HandleManagementOverviewPage extends StatefulWidget {
  const HandleManagementOverviewPage({super.key});

  @override
  State<HandleManagementOverviewPage> createState() =>
      _HandleManagementOverviewPageState();
}

class _HandleManagementOverviewPageState
    extends State<HandleManagementOverviewPage> {
  final GlobalKey spraywallKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final navigationController =
        Provider.of<NavigationControllerAbstract>(context, listen: false);
    final SpraywallTransformationController transformationController =
        Provider.of<HandleControllerAbstract>(context, listen: false)
            .transformationController;
    return Scaffold(
      appBar: AppBar(
        title: Text(UiHelper.getAppLocalization().holdManagementOptionTitle),
      ),
      body: Stack(
        children: [
          Container(
            key: spraywallKey,
            child: SpraywallBasePanel(
              widgetFactory: (handle) => SpraywallHandleOverviewButton(
                id: handle.id!,
                handleDiameter: handle.radius.toDouble(),
              ),
              transformationController: transformationController,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                navigationController.pushPage(
                    context, AppRoute.handleManagementEdit);
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
