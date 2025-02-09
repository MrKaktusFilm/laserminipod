import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_button.dart';
import 'package:user_app/views/spraywall/spraywall_edit_panel.dart';

class HandleManagementEditPage extends StatefulWidget {
  final TransformationController? startTransformation;
  // null, if new handle is added
  final int? selectedHandle;
  const HandleManagementEditPage(
      {super.key, this.startTransformation, this.selectedHandle});

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
                widgetFactory: (handle) => SpraywallHandleButton(
                    id: handle.id!, handleDiameter: handle.radius.toDouble()),
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
          if (widget.selectedHandle != null)
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
