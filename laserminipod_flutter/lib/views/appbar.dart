import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/routes.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HomeAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final userController =
        Provider.of<UserControllerAbstract>(context, listen: false);
    final navigationController =
        Provider.of<NavigationControllerAbstract>(context, listen: false);
    final loc = UiHelper.getAppLocalization();

    return AppBar(
      title: Text(title),
      actions: [
        PopupMenuButton<String>(
          icon: Icon(Icons.person),
          itemBuilder: (BuildContext context) {
            return [
              if (!userController.isSignedIn())
                PopupMenuItem(
                  child: Text(loc.login),
                  onTap: () =>
                      navigationController.pushPage(context, AppRoute.login),
                ),
              if (userController.isSignedIn())
                PopupMenuItem(
                  onTap: userController.logOut,
                  child: Text(loc.logout),
                ),
              PopupMenuItem(
                onTap: () =>
                    navigationController.pushPage(context, AppRoute.settings),
                child: Text(loc.settingsTitle),
              ),
              PopupMenuItem(
                onTap: () {
                  navigationController.setPageIndex(context, 0);
                  navigationController.goToPage(AppRoute.serverSelection);
                },
                child: Text(loc.switchBoulder),
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
