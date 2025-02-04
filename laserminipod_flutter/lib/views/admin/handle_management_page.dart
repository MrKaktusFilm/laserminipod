import 'package:flutter/material.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_button.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';

class HandleManagementPage extends StatefulWidget {
  const HandleManagementPage({super.key});

  @override
  State<HandleManagementPage> createState() => _HandleManagementPageState();
}

class _HandleManagementPageState extends State<HandleManagementPage> {
  double handleDiameter = 50.0;
  Offset handlePosition = const Offset(0, 0);
  final TransformationController transformationController =
      TransformationController();
  final GlobalKey spraywallKey = GlobalKey();

  void addHandleData() {
    final RenderBox? spraywallBox =
        spraywallKey.currentContext?.findRenderObject() as RenderBox?;
    if (spraywallBox == null) return;

    // Hole die aktuelle Matrix
    final Matrix4 matrix = transformationController.value;
    final double scale = matrix.getMaxScaleOnAxis();

    // Berechne die Position relativ zum Container
    final Size spraywallSize = spraywallBox.size;
    final Offset centerOffset =
        Offset(spraywallSize.width / 2, spraywallSize.height / 2);

    // Berechne die finale Position
    final Offset adjustedPosition = (handlePosition + centerOffset);
    final double x = adjustedPosition.dy; // Verwende dy für bottom
    final double y =
        spraywallSize.width - adjustedPosition.dx; // Verwende dx für right

    // Berücksichtige den Scale-Faktor
    final double scaledX = x / scale;
    final double scaledY = y / scale;

    // Speichere den Handle
    final spraywallController =
        Provider.of<SprayWallControllerAbstract>(context, listen: false);

    debugPrint('Saved Handle Position - x: $scaledX, y: $scaledY');
  }

  void test() {
    final Matrix4 matrix = transformationController.value;
    final double scale = matrix.getMaxScaleOnAxis();

    print(matrix);
    print(scale);
    print(matrix.getColumn(3) * 1 / scale);
    print(context.size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handle Management'),
      ),
      body: Stack(
        children: [
          Container(
            key: spraywallKey,
            child: UiHelper.getSpraywallPanel(
              context,
              transformationController,
              (handle) => SpraywallHandleButton(id: handle.id!),
            ),
          ),
          Center(
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  handlePosition += details.delta;
                });
              },
              child: CustomPaint(
                painter: HandlePainter(
                  handlePosition: handlePosition,
                  handleDiameter: handleDiameter,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 300, right: 300, child: SpraywallHandleButton(id: 10)),
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
                  onPressed: test,
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

class HandlePainter extends CustomPainter {
  final Offset handlePosition;
  final double handleDiameter;

  HandlePainter({required this.handlePosition, required this.handleDiameter});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2) + handlePosition;
    canvas.drawCircle(center, handleDiameter / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
