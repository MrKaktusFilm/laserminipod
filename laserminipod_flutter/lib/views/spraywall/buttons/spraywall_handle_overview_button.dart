import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_button_template.dart';

class SpraywallHandleOverviewButton extends StatefulWidget {
  final int id;
  final double handleDiameter;
  const SpraywallHandleOverviewButton(
      {super.key, required this.handleDiameter, required this.id});

  @override
  State<SpraywallHandleOverviewButton> createState() =>
      _SpraywallHandleOverviewButtonState();
}

class _SpraywallHandleOverviewButtonState
    extends State<SpraywallHandleOverviewButton> {
  void _onTap() {
    Provider.of<HandleControllerAbstract>(context, listen: false)
        .setSelectedHandleId(widget.id, context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _onTap,
        child: SpraywallHandleButtonTemplate(
            handleDiameter: widget.handleDiameter, color: Colors.red));
  }
}
