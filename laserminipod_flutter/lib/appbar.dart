import 'package:flutter/material.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/home.dart';
import 'package:user_app/views/dialogs/login_dialog.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HomeAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final adminController = AppState.of(context)?.adminController;

    return AppBar(
      title: Text(title),
      actions: [
        PopupMenuButton<String>(
          onSelected: (String value) {
            // Aktion basierend auf der Auswahl
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gewählt: $value')),
            );
          },
          itemBuilder: (BuildContext context) {
            return [
              if (!adminController!.hasAdminAccess())
                PopupMenuItem(
                  value: 'Option 1',
                  child: const Text("Login"),
                  onTap: () => UiHelper.showWidgetDialog(const LoginDialog()),
                ),
              if (adminController.hasAdminAccess())
                PopupMenuItem(
                  value: 'Logout',
                  onTap: adminController.logOut,
                  child: const Text('Logout'),
                ),
              const PopupMenuItem(
                value: 'Option 3',
                child: Text('Option 3'),
              ),
            ];
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
