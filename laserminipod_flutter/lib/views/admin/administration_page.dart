import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/views/admin/change_password_page.dart';
import 'package:user_app/views/admin/handle_management_overview_page.dart';
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
          title: 'Handle Management',
          subtitle: 'Add, edit and delete handles',
          onTap: () => _navigationController.openPage(
              context, HandleManagementOverviewPage())),
      SettingItem(
          icon: Icons.key,
          title: 'Change password',
          subtitle: 'Change Admin login credentials',
          onTap: () =>
              _navigationController.openPage(context, ChangePasswordPage())),
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
