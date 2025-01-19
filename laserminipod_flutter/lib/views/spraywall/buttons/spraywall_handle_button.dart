import 'package:flutter/material.dart';
import 'package:user_app/home.dart';

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
    AppState.of(context)?.spraywallController.updateExistsRouteAlready();
  }

  @override
  void didChangeDependencies() {
    _add = AppState.of(context)?.spraywallController.addHandle;
    _remove = AppState.of(context)?.spraywallController.removeHandle;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    activated =
        AppState.of(context)!.spraywallController.isHandleActivated(widget.id);
    return FilledButton(
      onPressed: toggleActivated,
      style: FilledButton.styleFrom(
        backgroundColor: activated == true ? Colors.green : Colors.red,
      ),
      child: null,
    );
  }
}
