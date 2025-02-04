import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_button.dart';
import 'package:user_app/views/spraywall/spraywall_base_panel.dart';

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
              onPanUpdate: (details) {
                handleController.updateSelectedHandlePosition(details.delta);
              },
              onTapDown: (details) {
                var width = context.size!.width;
                var height = context.size!.height;
                print(details.localPosition);
                print("$width | $height");
              },
              child: SpraywallBasePanel(
                transformationController: transformationController,
                widgetFactory: (handle) =>
                    SpraywallHandleButton(id: handle.id!),
              ),
            ),
          ),
          Consumer<HandleControllerAbstract>(
            builder: (context, handleController, child) {
              return Positioned(
                left: handleController.selectedHandlePosition!.dx -
                    handleDiameter / 2,
                top: handleController.selectedHandlePosition!.dy -
                    handleDiameter / 2,
                child: Container(
                  width: handleDiameter,
                  height: handleDiameter,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(0.7),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Slider(
                  value: handleDiameter,
                  min: 20.0,
                  max: 150.0,
                  onChanged: (value) {
                    setState(() {
                      handleDiameter = value;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {},
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
