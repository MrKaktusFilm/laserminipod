import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/language_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:locale_names/locale_names.dart';

class LanguageDialog extends StatelessWidget {
  LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = UiHelper.getAppLocalization();
    final languageController = Provider.of<LanguageControllerAbstract>(context);
    final supportedLanguages = languageController.supportedLanguages;
    Locale selectedLanguage = languageController.currentLanguage;
    var navigationController =
        Provider.of<NavigationControllerAbstract>(context, listen: false);

    return AlertDialog(
      title: Text(loc.chooseLanguage),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: supportedLanguages.map((language) {
          return RadioListTile<Locale>(
            title: Row(
              children: [
                CountryFlag.fromLanguageCode(
                  language.languageCode,
                  shape: const RoundedRectangle(6),
                  height: 20,
                  width: 30,
                ),
                SizedBox(width: 10),
                Text(language.nativeDisplayLanguage),
              ],
            ),
            value: language,
            groupValue: selectedLanguage,
            onChanged: (value) {
              if (value != null) {
                // Navigator.of(context).pop();
                // Use a microtask to change the language after the dialog is closed
                Future.microtask(() {
                  languageController.setLanguage(value);
                });
              }
            },
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => navigationController.closeCurrentScreen(context),
          child: Text(loc.cancel),
        ),
      ],
    );
  }
}
