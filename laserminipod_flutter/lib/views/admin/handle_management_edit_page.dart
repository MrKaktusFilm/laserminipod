import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_button.dart';
import 'package:user_app/views/spraywall/spraywall_edit_panel.dart';

class HandleManagementEditPage extends StatefulWidget {
  final TransformationController? startTransformation;
  final int? selectedHandle;
  const HandleManagementEditPage(
      {super.key, this.startTransformation, this.selectedHandle});

  @override
  State<HandleManagementEditPage> createState() =>
      _HandleManagementEditPageState();
}

class _HandleManagementEditPageState extends State<HandleManagementEditPage> {
  double handleDiameter = 50.0;
  final GlobalKey spraywallKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final TransformationController transformationController =
        Provider.of<SprayWallControllerAbstract>(context, listen: false)
            .getSpraywallTransformationController();
    final HandleControllerAbstract handleController =
        Provider.of<HandleControllerAbstract>(context, listen: false);

    if (widget.selectedHandle == null) {
      handleController.setSelectedHandleToMiddle(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Handle Management'),
      ),
      body: Stack(
        children: [
          Container(
            key: spraywallKey,
            child: GestureDetector(
              child: SpraywallEditPanel(
                transformationController: transformationController,
                widgetFactory: (handle) =>
                    SpraywallHandleButton(id: handle.id!),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Consumer<HandleControllerAbstract>(
                    builder: (context, handleControllerTemp, child) {
                  return Slider(
                    value: handleControllerTemp.selectedHandleDiameter,
                    min: 20.0,
                    max: 150.0,
                    onChanged: (value) {
                      handleControllerTemp.setSelectedHandleDiameter(value);
                    },
                  );
                }),
                ElevatedButton(
                  onPressed: () {
                    handleController.saveNewHandle();
                  },
                  child: const Text('Add Handle Data'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
