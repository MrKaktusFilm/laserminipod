import 'package:flutter/material.dart';

class SpraywallHandleEditButton extends StatelessWidget {
  final double handleDiameter;

  const SpraywallHandleEditButton({super.key, required this.handleDiameter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: handleDiameter,
      height: handleDiameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
    );
  }
}
