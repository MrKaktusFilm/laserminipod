import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';

class SpraywallHandleButton2 extends StatefulWidget {
  final int id;
  final double handleDiameter;
  const SpraywallHandleButton2(
      {super.key, required this.handleDiameter, required this.id});

  @override
  State<SpraywallHandleButton2> createState() => _SpraywallHandleButton2State();
}

class _SpraywallHandleButton2State extends State<SpraywallHandleButton2> {
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
