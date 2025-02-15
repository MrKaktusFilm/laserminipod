import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart'; // Importiere den UiHelper

class SaveRouteDialog extends StatefulWidget {
  const SaveRouteDialog({super.key});

  @override
  State<SaveRouteDialog> createState() => _SaveRouteDialogState();
}

class _SaveRouteDialogState extends State<SaveRouteDialog> {
  final _formKey = GlobalKey<FormState>();

  void _onSave() async {
    final controller =
        Provider.of<RouteControllerAbstract>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      controller.saveCurrentRoute();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<RouteControllerAbstract>(context, listen: false);
    final loc = UiHelper.getAppLocalization(); // Zugriff auf Lokalisierungen

    return Form(
      key: _formKey,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: loc.routeName, // Verwendung der Lokalisierung
                  filled: true,
                  errorText: controller.nameErrorMessage,
                ),
                onChanged: (value) {
                  controller.updateNameStatus(value);
                },
                validator: (input) {
                  return controller.validateRouteName(input);
                },
              ),
              if (controller.isLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircularProgressIndicator(),
                ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: _onSave,
                    child: Text(loc.save), // Verwendung der Lokalisierung
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(loc.cancel), // Verwendung der Lokalisierung
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
