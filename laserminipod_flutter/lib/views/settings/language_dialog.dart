import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/language_controller_abstract.dart';
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

    return AlertDialog(
      title: Text(loc.chooseLanguage),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: supportedLanguages.map((language) {
          return RadioListTile<Locale>(
            title: Text(language.nativeDisplayLanguage),
            value: language,
            groupValue: selectedLanguage,
            onChanged: (value) {
              if (value != null) {
                languageController.setLanguage(value);
                Navigator.of(context).pop();
              }
            },
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(loc.cancel),
        ),
      ],
    );
  }
}
