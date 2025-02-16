import 'dart:io';

import 'package:flutter/material.dart';
import 'package:user_app/domain/abstract/language_controller_abstract.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageController extends ChangeNotifier
    implements LanguageControllerAbstract {
  late Locale _currentLanguage;

  LanguageController() {
    // substring, damit nur zb en rauskommt, nicht en_US
    _currentLanguage = Locale(Platform.localeName.substring(0, 2));
  }

  @override
  Locale get currentLanguage => _currentLanguage;

  @override
  void setLanguage(Locale language) {
    _currentLanguage = language;
    notifyListeners();
  }

  @override
  List<Locale> get supportedLanguages => AppLocalizations.supportedLocales;
}
