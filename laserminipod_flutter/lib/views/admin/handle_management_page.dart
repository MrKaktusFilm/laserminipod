import 'package:flutter/material.dart';

class HandleManagementPage extends StatefulWidget {
  const HandleManagementPage({super.key});

  @override
  State<HandleManagementPage> createState() => _HandleManagementPageState();
}

class _HandleManagementPageState extends State<HandleManagementPage> {
  double handleDiameter = 50.0;
  Offset handlePosition = const Offset(0, 0);
  TransformationController controller = TransformationController();

  void addHandleData() {
    final Matrix4 matrix = controller.value;
    final double scale = matrix.getMaxScaleOnAxis();
    final Offset imageOffset =
        (handlePosition - Offset(matrix[12], matrix[13])) / scale;

    debugPrint('Handle Position on Image: $imageOffset');
    debugPrint('Handle Diameter: $handleDiameter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handle Management'),
      ),
      body: Stack(
        children: [
          InteractiveViewer(
            transformationController: controller,
            panEnabled: true,
            scaleEnabled: true,
            constrained: false,
            boundaryMargin: const EdgeInsets.all(double.infinity),
            child: Center(
              child: Image.asset('assets/img/spraywall_example.jpg'),
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
                  onPressed: addHandleData,
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
