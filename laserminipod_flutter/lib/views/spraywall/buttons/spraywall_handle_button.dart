import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';

class SpraywallHandleButton extends StatefulWidget {
  final int id;

  const SpraywallHandleButton({super.key, required this.id});

  @override
  State<SpraywallHandleButton> createState() => _SpraywallHandleButtonState();
}

class _SpraywallHandleButtonState extends State<SpraywallHandleButton> {
  bool activated = false;
  late Function(int)? _add;
  late Function(int)? _remove;

  void toggleActivated() {
    setState(() {
      activated = !activated;
      if (activated) {
        _add!(widget.id);
      } else {
        _remove!(widget.id);
      }
    });
  }

  @override
  void didChangeDependencies() {
    _add = Provider.of<SprayWallControllerAbstract>(context, listen: false)
        .addHandle;
    _remove = Provider.of<SprayWallControllerAbstract>(context, listen: false)
        .removeHandle;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    activated = Provider.of<SprayWallControllerAbstract>(context, listen: false)
        .isHandleActivated(widget.id);
    return FilledButton(
      onPressed: toggleActivated,
      style: FilledButton.styleFrom(
        backgroundColor: activated == true ? Colors.green : Colors.red,
      ),
      child: null,
    );
  }
}
