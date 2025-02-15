import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/views/common/setting_item.dart';
import 'package:user_app/views/settings/language_dialog.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
          icon: Icons.language,
          title: 'Handle Management',
          subtitle: 'Add, edit and delete handles',
          onTap: () => UiHelper.showWidgetDialog(LanguageDialog())),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView.builder(
        itemCount: settings.length,
        itemBuilder: (context, index) {
          final item = settings[index];
          return ListTile(
              leading: Icon(item.icon, color: Colors.blue),
              title: Text(item.title),
              subtitle: Text(item.subtitle),
              onTap: item.onTap);
        },
      ),
    );
  }
}
