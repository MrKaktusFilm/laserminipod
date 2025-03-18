import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/domain/spraywall_transformation_controller.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_button_template.dart';
import 'package:user_app/views/spraywall/spraywall_edit_panel.dart';

class HandleManagementEditPage extends StatefulWidget {
  const HandleManagementEditPage({
    super.key,
  });

  @override
  State<HandleManagementEditPage> createState() =>
      _HandleManagementEditPageState();
}

class _HandleManagementEditPageState extends State<HandleManagementEditPage> {
  double handleDiameter = 50.0;
  late HandleControllerAbstract _handleController;
  final GlobalKey spraywallKey = GlobalKey();

  @override
  void initState() {
    _handleController =
        Provider.of<HandleControllerAbstract>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _handleController.deselectHandle();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HandleControllerAbstract handleController =
        Provider.of<HandleControllerAbstract>(context, listen: false);
    final SpraywallTransformationController transformationController =
        handleController.transformationController;

    handleController.setNewHandlePositionToScreenMiddle(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(UiHelper.getAppLocalization().holdManagementOptionTitle),
      ),
      body: Stack(
        children: [
          Container(
            key: spraywallKey,
            child: GestureDetector(
              child: SpraywallEditPanel(
                transformationController: transformationController,
                widgetFactory: (handle) => SpraywallHandleButtonTemplate(
                  handleDiameter: handle.radius.toDouble(),
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 55,
            left: 20,
            right: 20,
            child: Consumer<HandleControllerAbstract>(
                builder: (context, handleControllerTemp, child) {
              return Slider(
                value: handleControllerTemp.selectedHandleDiameter,
                min: 20.0,
                max: 300.0,
                onChanged: (value) {
                  handleControllerTemp.setSelectedHandleDiameter(value);
                },
              );
            }),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: 'saveButton',
              onPressed: () {
                handleController.saveHandle(context);
              },
              child: const Icon(Icons.save),
            ),
          ),
          if (handleController.isHandleSelected())
            Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                heroTag: 'deleteButton',
                onPressed: () {
                  handleController.deleteHandle(context);
                },
                child: const Icon(Icons.delete),
              ),
            ),
        ],
      ),
    );
  }
}
