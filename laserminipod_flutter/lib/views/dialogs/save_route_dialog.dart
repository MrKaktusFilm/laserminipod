import 'package:flutter/material.dart';
import 'package:user_app/home.dart';

class SaveRouteDialog extends StatefulWidget {
  const SaveRouteDialog({super.key});

  @override
  State<SaveRouteDialog> createState() => _SaveRouteDialogState();
}

class _SaveRouteDialogState extends State<SaveRouteDialog> {
  String _name = "";
  final _formKey = GlobalKey<FormState>();

  String? validator(String? input) {
    if (input == null || input.isEmpty || input.trim().isEmpty) {
      return "Text ist leer";
    }
    if (AppState.of(context)!.spraywallController.nameAlreadyAssigned(input)) {
      return "Eine andere Route hat bereits diesen Namen";
    }
    return null;
  }

  void onSave() {
    if (_formKey.currentState!.validate()) {
      AppState.of(context)!.spraywallController.saveCurrentRoute(_name.trim());
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Route gespeichert.")));
    }
  }

  @override
  Widget build(BuildContext context) {
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
                decoration: const InputDecoration(
                  labelText: "Name der Route:",
                  filled: true,
                ),
                onChanged: (value) => setState(() {
                  _name = value;
                  //_formKey.currentState!.validate();
                }),
                validator: validator,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: onSave,
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
