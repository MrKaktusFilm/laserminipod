import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/common/enums/handle_state_enum.dart';
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
  HandleStateEnum activated = HandleStateEnum.deactivated;

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
        .getHandleStatus(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<SprayWallControllerAbstract>(context, listen: false)
        .getHandleStatus(widget.id);
    return GestureDetector(
        onTap: toggleActivated,
        child: SpraywallHandleButtonTemplate(
            handleDiameter: widget.handleDiameter,
            color: state.getStateColor()));
  }
}
