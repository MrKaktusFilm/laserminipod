import 'package:flutter/material.dart';
import 'package:user_app/home.dart';

class DeleteRouteDialog extends StatefulWidget {
  const DeleteRouteDialog({super.key, required this.id});

  final int id;

  @override
  State<DeleteRouteDialog> createState() => _DeleteRouteDialogState();
}

class _DeleteRouteDialogState extends State<DeleteRouteDialog> {
  void onDelete() {
    AppState.of(context)!.spraywallController.deleteRoute(widget.id);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Wollen Sie die Route wirklich löschen?"),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: onDelete,
                  child: const Text("Löschen"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Abbrechen"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
