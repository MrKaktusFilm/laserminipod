import 'package:flutter/material.dart';

class SpraywallFloatingButton extends StatelessWidget {
  const SpraywallFloatingButton(
      {super.key, required this.icon, required this.action});

  final IconData icon;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: null, onPressed: action, child: Icon(icon));
  }
}
