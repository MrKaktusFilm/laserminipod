import 'package:flutter/material.dart';

abstract class LanguageControllerAbstract extends ChangeNotifier {
  List<Locale> get supportedLanguages;

  Locale get currentLanguage;

  void setLanguage(Locale language);
}
