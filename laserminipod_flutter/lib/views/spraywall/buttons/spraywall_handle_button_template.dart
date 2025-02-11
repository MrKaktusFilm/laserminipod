import 'package:flutter/material.dart';

class SpraywallHandleButtonTemplate extends StatelessWidget {
  final double handleDiameter;
  final Color color;
  const SpraywallHandleButtonTemplate(
      {super.key, required this.handleDiameter, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: handleDiameter,
      height: handleDiameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.5),
      ),
    );
  }
}
