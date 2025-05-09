import 'package:flutter/material.dart';
import 'package:user_app/generated/i18n/app_localizations.dart';
import 'package:user_app/main.dart';

abstract class UiHelper {
  static bool debug = true;

  static void showSnackbar(String message, Color color) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  static void showErrorSnackbar(String message, Exception e) {
    if (debug) {
      message = '$message: $e';
    }
    showSnackbar(message, Colors.red);
  }

  static void showWidgetDialog(Widget dialog) {
    final context = navigatorKey.currentState?.overlay?.context;
    showDialog(
      context: context!,
      builder: (BuildContext context) => dialog,
    );
  }

  static AppLocalizations getAppLocalization() {
    final context = navigatorKey.currentState?.overlay?.context;
    return AppLocalizations.of(context!)!;
  }

  static AppLocalizations? getAppLocalizationNullSafe() {
    final context = navigatorKey.currentState?.overlay?.context;
    if (context == null) {
      return null;
    }
    return AppLocalizations.of(context);
  }
}
