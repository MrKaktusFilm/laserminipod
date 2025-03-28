import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:user_app/constants.dart';
import 'package:user_app/domain/abstract/feedback_controller_abstract.dart';
import 'package:user_app/domain/abstract/language_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/main.dart';
import 'package:user_app/routes.dart';
import 'package:user_app/views/dialogs/change_username_dialog.dart';
import 'package:user_app/views/dialogs/delete_user_dialog.dart';
import 'package:user_app/views/settings/language_dialog.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late NavigationControllerAbstract _navigationController;
  late UserControllerAbstract _userController;
  late FeedbackControllerAbstract _feedbackController;

  late List<_SettingItem> settings;

  @override
  void initState() {
    super.initState();
    _navigationController =
        Provider.of<NavigationControllerAbstract>(context, listen: false);
    _userController =
        Provider.of<UserControllerAbstract>(context, listen: false);
    _feedbackController =
        Provider.of<FeedbackControllerAbstract>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final loc = UiHelper.getAppLocalization();
    settings = [
      _SettingItem(
          icon: Icons.language,
          title: loc.chooseLanguage,
          subtitle: '',
          onTap: () => UiHelper.showWidgetDialog(LanguageDialog())),
      _SettingItem(
          icon: Icons.key,
          title: UiHelper.getAppLocalization().changePasswordOptionTitle,
          subtitle: '',
          scope: Scopes.user,
          onTap: () =>
              _navigationController.pushPage(context, AppRoute.changePassword)),
      _SettingItem(
          icon: Icons.delete_forever,
          title: loc.deleteUser,
          subtitle: '',
          scope: Scopes.useronly,
          onTap: () => UiHelper.showWidgetDialog(DeleteUserDialog())),
      _SettingItem(
          icon: Icons.feedback,
          title: loc.feedback,
          subtitle: '',
          onTap: () => _feedbackController.submitFeedback(context)),
      _SettingItem(
          icon: Icons.description,
          title: loc.termsAndConditions,
          subtitle: '',
          onTap: () {}),
      _SettingItem(
          icon: Icons.privacy_tip,
          title: loc.privacyPolicy,
          subtitle: '',
          onTap: () {}),
    ];
    if (_userController.isSignedIn()) {
      bool admin = _userController.hasAdminRights();
      if (admin) {
        settings =
            settings.where((item) => item.scope != Scopes.useronly).toList();
      } else {
        settings =
            settings.where((item) => item.scope != Scopes.admin).toList();
      }
    } else {
      settings = settings.where((item) => item.scope == Scopes.guest).toList();
    }
    return Consumer<LanguageControllerAbstract>(
        builder: (context, languageController, child) {
      return Scaffold(
        appBar: AppBar(title: Text(loc.settingsTitle)),
        body: Column(
          children: [
            if (_userController.isSignedIn())
              Consumer<UserControllerAbstract>(
                  builder: (context, userController, child) {
                return ListTile(
                  leading: UserImageButton(sessionManager: sessionManager),
                  title: Row(
                    children: [
                      Text(userController.getSignedInUserName()!),
                      SizedBox(width: 10),
                      if (userController.hasAdminRights())
                        Icon(
                          Icons.settings,
                          size: 20,
                        ),
                    ],
                  ),
                  subtitle: Text(userController.getSignedInEmail()!),
                  trailing: IconButton(
                      onPressed: _changeUserName, icon: Icon(Icons.edit)),
                );
              }),
            if (_userController.isSignedIn()) Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: settings.length,
                itemBuilder: (context, index) {
                  final item = settings[index];
                  return ListTile(
                      key: ValueKey(
                          languageController.currentLanguage.languageCode),
                      leading: Icon(item.icon, color: Colors.blue),
                      title: Text(item.title),
                      subtitle: Text(item.subtitle),
                      onTap: item.onTap);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(versionNumber),
            ),
          ],
        ),
      );
    });
  }

  void _changeUserName() {
    UiHelper.showWidgetDialog(ChangeUsernameDialog());
  }
}

class _SettingItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Scopes scope;

  _SettingItem(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap,
      this.scope = Scopes.guest});
}
