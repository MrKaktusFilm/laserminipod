import 'package:flutter/material.dart';

class LanguageDialog extends StatelessWidget {
  final List<String> languages = ['Deutsch', 'English', 'Español', 'Français'];
  final String selectedLanguage = 'Deutsch';

  LanguageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Sprache auswählen'),
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
          child: Text('Abbrechen'),
        ),
      ],
    );
  }
}
