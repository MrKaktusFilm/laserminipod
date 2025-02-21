import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/routes.dart';
import 'package:user_app/views/common/setting_item.dart';

class AdministrationPage extends StatefulWidget {
  const AdministrationPage({super.key});

  @override
  State<AdministrationPage> createState() => _AdministrationPageState();
}

class _AdministrationPageState extends State<AdministrationPage> {
  late NavigationControllerAbstract _navigationController;

  late List<SettingItem> settings;

  @override
  void initState() {
    super.initState();
    // NavigationController hier initialisieren
    _navigationController =
        Provider.of<NavigationControllerAbstract>(context, listen: false);
    settings = [
      SettingItem(
          icon: Icons.edit,
          title: UiHelper.getAppLocalization().holdManagementOptionTitle,
          subtitle: UiHelper.getAppLocalization().holdManagementOptionSubtitle,
          onTap: () => _navigationController.pushPage(
              context, AppRoute.handleManagementOverview)),
      SettingItem(
          icon: Icons.key,
          title: UiHelper.getAppLocalization().changePasswordOptionTitle,
          subtitle: UiHelper.getAppLocalization().changePasswordOptionSubtitle,
          onTap: () =>
              _navigationController.pushPage(context, AppRoute.changePassword)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: settings.length,
      itemBuilder: (context, index) {
        final item = settings[index];
        return ListTile(
            leading: Icon(item.icon, color: Colors.blue),
            title: Text(item.title),
            subtitle: Text(item.subtitle),
            onTap: item.onTap);
      },
    );
  }
}
