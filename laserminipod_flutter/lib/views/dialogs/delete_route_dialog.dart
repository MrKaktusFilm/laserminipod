import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class DeleteRouteDialog extends StatefulWidget {
  const DeleteRouteDialog({super.key, required this.id});

  final int id;

  @override
  State<DeleteRouteDialog> createState() => _DeleteRouteDialogState();
}

class _DeleteRouteDialogState extends State<DeleteRouteDialog> {
  void onDelete() {
    Provider.of<RouteControllerAbstract>(context, listen: false)
        .deleteRoute(widget.id);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final loc = UiHelper.getAppLocalization(); // Zugriff auf Lokalisierungen

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(loc.deleteRouteDialogText), // Verwendung der Lokalisierung
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: onDelete,
                  child: Text(loc.delete), // Verwendung der Lokalisierung
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(loc.cancel), // Verwendung der Lokalisierung
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
