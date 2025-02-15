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
    final loc = UiHelper.getAppLocalization();
    _navigationController =
        Provider.of<NavigationControllerAbstract>(context, listen: false);
    settings = [
      SettingItem(
          icon: Icons.language,
          title: loc.chooseLanguage,
          subtitle: '',
          onTap: () => UiHelper.showWidgetDialog(LanguageDialog())),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final loc = UiHelper.getAppLocalization();
    return Scaffold(
      appBar: AppBar(title: Text(loc.settingsTitle)),
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
