import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/server_connection_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/routes.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final userController =
        Provider.of<UserControllerAbstract>(context, listen: false);
    final navigationController =
        Provider.of<NavigationControllerAbstract>(context, listen: false);
    final loc = UiHelper.getAppLocalization();

    return AppBar(
      title: Consumer<SprayWallControllerAbstract>(
        builder: (context, spraywallController, child) {
          return FutureBuilder(
              future: spraywallController.getSpraywallName(),
              builder: (context, snapshot) {
                return Text(
                  snapshot.hasData ? snapshot.data! : '',
                  style: const TextStyle(fontSize: 20),
                );
              });
        },
      ),
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
                onTap: () => _closeServerConnection(context),
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

  void _closeServerConnection(BuildContext context) {
    final serverConnectionController =
        Provider.of<ServerConnectionControllerAbstract>(context, listen: false);
    serverConnectionController.deactivateActiveConnection();

    final navigationController =
        Provider.of<NavigationControllerAbstract>(context, listen: false);

    navigationController.goToPage(AppRoute.serverSelection);
  }
}
