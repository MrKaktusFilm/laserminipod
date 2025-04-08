import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/routes.dart';
import 'package:user_app/views/dialogs/change_spraywall_name_dialog.dart';

class AdministrationPage extends StatefulWidget {
  const AdministrationPage({super.key});

  @override
  State<AdministrationPage> createState() => _AdministrationPageState();
}

class _AdministrationPageState extends State<AdministrationPage> {
  late NavigationControllerAbstract _navigationController;

  late List<_SettingItem> settings;

  @override
  void initState() {
    super.initState();
    _navigationController =
        Provider.of<NavigationControllerAbstract>(context, listen: false);
    settings = [
      _SettingItem(
          icon: Icons.back_hand,
          title: UiHelper.getAppLocalization().holdManagementOptionTitle,
          subtitle: UiHelper.getAppLocalization().holdManagementOptionSubtitle,
          onTap: () => _navigationController.pushPage(
              context, AppRoute.handleManagementOverview)),
      _SettingItem(
          icon: Icons.edit,
          title: UiHelper.getAppLocalization().changeSpraywallName,
          subtitle: UiHelper.getAppLocalization().changeSpraywallNameSubtitle,
          onTap: () => UiHelper.showWidgetDialog(ChangeSpraywallNameDialog())),
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

class _SettingItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  _SettingItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}
