import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_app/domain/abstract/language_controller_abstract.dart';
import 'package:user_app/generated/i18n/app_localizations.dart';

class LanguageController extends ChangeNotifier
    implements LanguageControllerAbstract {
  static const String _languageKey = 'selected_language';
  late Locale _currentLanguage;

  LanguageController() {
    // Initialize with saved language or system default
    _initLanguage();
  }

  Future<void> _initLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguageCode = prefs.getString(_languageKey);

    if (savedLanguageCode != null) {
      _currentLanguage = Locale(savedLanguageCode);
    } else {
      _currentLanguage = Locale(Platform.localeName.substring(0, 2));
    }
    notifyListeners();
  }

  @override
  Locale get currentLanguage => _currentLanguage;

  @override
  Future<void> setLanguage(Locale language) async {
    if (_currentLanguage.languageCode == language.languageCode) return;
    _currentLanguage = language;
    // Persist the language selection
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language.languageCode);

    notifyListeners();
  }

  @override
  List<Locale> get supportedLanguages => AppLocalizations.supportedLocales;
}
