import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_button_template.dart';

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
    var activated =
        Provider.of<SprayWallControllerAbstract>(context, listen: false)
            .isHandleActivated(widget.id);
    return GestureDetector(
        onTap: toggleActivated,
        child: activated == true
            ? SpraywallHandleButtonTemplate(
                handleDiameter: widget.handleDiameter, color: Colors.green)
            : SpraywallHandleButtonTemplate(
                handleDiameter: widget.handleDiameter, color: Colors.red));
  }
}
