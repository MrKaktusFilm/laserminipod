import 'package:flutter/material.dart';

class AdministrationPage extends StatelessWidget {
  final List<SettingItem> settings = [
    SettingItem(
        icon: Icons.wifi, title: 'WLAN', subtitle: 'Mit WLAN verbinden'),
    SettingItem(
        icon: Icons.bluetooth,
        title: 'Bluetooth',
        subtitle: 'Geräte koppeln und verwalten'),
    SettingItem(
        icon: Icons.notifications,
        title: 'Benachrichtigungen',
        subtitle: 'Einstellungen für Benachrichtigungen'),
    SettingItem(
        icon: Icons.lock,
        title: 'Datenschutz',
        subtitle: 'Passwort und Sicherheit'),
    SettingItem(icon: Icons.info, title: 'Info', subtitle: 'Über die App'),
  ];

  AdministrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Einstellungen'),
      ),
      body: ListView.builder(
        itemCount: settings.length,
        itemBuilder: (context, index) {
          final item = settings[index];
          return ListTile(
            leading: Icon(item.icon, color: Colors.blue),
            title: Text(item.title),
            subtitle: Text(item.subtitle),
            onTap: () {
              // Aktion bei Klick
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('"${item.title}" ausgewählt')),
              );
            },
          );
        },
      ),
    );
  }
}

class SettingItem {
  final IconData icon;
  final String title;
  final String subtitle;

  SettingItem(
      {required this.icon, required this.title, required this.subtitle});
}
