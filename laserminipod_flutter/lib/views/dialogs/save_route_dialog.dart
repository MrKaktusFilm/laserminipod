import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';

class SaveRouteDialog extends StatefulWidget {
  const SaveRouteDialog({super.key});

  @override
  State<SaveRouteDialog> createState() => _SaveRouteDialogState();
}

class _SaveRouteDialogState extends State<SaveRouteDialog> {
  final _formKey = GlobalKey<FormState>();

  void _onSave() async {
    final controller =
        Provider.of<SprayWallControllerAbstract>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      controller.saveCurrentRoute();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<SprayWallControllerAbstract>(context, listen: false);

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
                  labelText: "Name der Route:",
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
              if (controller.isLoading())
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircularProgressIndicator(),
                ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: controller.isLoading() ? null : _onSave,
                    child: const Text("Speichern"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Abbrechen"),
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
