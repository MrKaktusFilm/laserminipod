import 'package:flutter/material.dart';
import 'package:user_app/domain/ui_helper.dart';

class LanguageDialog extends StatelessWidget {
  final List<String> languages = ['Deutsch', 'English', 'Español', 'Français'];
  final String selectedLanguage = 'Deutsch';

  LanguageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loc = UiHelper.getAppLocalization();
    return AlertDialog(
      title: Text(loc.chooseLanguage),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: languages.map((language) {
          return RadioListTile<String>(
            title: Text(language),
            value: language,
            groupValue: selectedLanguage,
            onChanged: (value) {
              if (value != null) {
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
