import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/admin_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/views/dialogs/login_dialog.dart';
import 'package:user_app/views/settings/settings_page.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HomeAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final adminController =
        Provider.of<AdminControllerAbstract>(context, listen: false);
    final navigationController =
        Provider.of<NavigationControllerAbstract>(context, listen: false);
    final loc = UiHelper.getAppLocalization();

    return AppBar(
      title: Text(title),
      actions: [
        PopupMenuButton<String>(
          itemBuilder: (BuildContext context) {
            return [
              if (!adminController.hasAdminAccess())
                PopupMenuItem(
                  child: Text(loc.login),
                  onTap: () => UiHelper.showWidgetDialog(const LoginDialog()),
                ),
              if (adminController.hasAdminAccess())
                PopupMenuItem(
                  onTap: adminController.logOut,
                  child: Text(loc.logout),
                ),
              PopupMenuItem(
                onTap: () =>
                    navigationController.openPage(context, SettingsPage()),
                child: Text(loc.settingsTitle),
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
