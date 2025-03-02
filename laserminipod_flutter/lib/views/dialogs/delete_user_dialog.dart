import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class DeleteUserDialog extends StatefulWidget {
  const DeleteUserDialog({super.key});

  @override
  State<DeleteUserDialog> createState() => _DeleteUserDialogState();
}

class _DeleteUserDialogState extends State<DeleteUserDialog> {
  Future<void> onDelete() async {
    await Provider.of<UserControllerAbstract>(context, listen: false)
        .deleteUser();
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
            Text(loc.deleteUserDialog), // Verwendung der Lokalisierung
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
