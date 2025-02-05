import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';

class SpraywallHandleButton extends StatefulWidget {
  final int id;
  final double handleDiameter;
  const SpraywallHandleButton(
      {super.key, required this.handleDiameter, required this.id});

  @override
  State<SpraywallHandleButton> createState() => _SpraywallHandleButtonState();
}

class _SpraywallHandleButtonState extends State<SpraywallHandleButton> {
  bool activated = false;

  void toggleActivated() {
    setState(() {
      activated =
          Provider.of<SprayWallControllerAbstract>(context, listen: false)
              .toggleHandle(widget.id);
    });
  }

  @override
  void initState() {
    super.initState();
    activated = Provider.of<SprayWallControllerAbstract>(context, listen: false)
        .isHandleActivated(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleActivated,
      child: Container(
        width: widget.handleDiameter,
        height: widget.handleDiameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: activated == true ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
