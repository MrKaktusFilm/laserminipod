import 'package:flutter/material.dart';
import 'package:user_app/main.dart';

class UiHelper {
  static void showSnackbar(String message, Color color) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  static void showErrorSnackbar(String message) {
    showSnackbar(message, Colors.red);
  }

  static void showWidgetDialog(Widget dialog) {
    final context = navigatorKey.currentState?.overlay?.context;
    showDialog(
      context: context!,
      builder: (BuildContext context) => dialog,
    );
  }
}
