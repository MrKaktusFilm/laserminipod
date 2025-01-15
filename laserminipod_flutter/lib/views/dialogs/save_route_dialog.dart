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
  bool _isNameAlreadyAssigned = false;

  String? validator(String? input) {
    if (input == null || input.isEmpty || input.trim().isEmpty) {
      return "Text ist leer";
    }
    _getAsyncData(input);
    if (!_isNameAlreadyAssigned) {
      return "Eine andere Route hat bereits diesen Namen";
    }
    return null;
  }

  /// gets data from server that is necessary for name field validation
  Future<void> _getAsyncData(String input) async {
    try {
      bool isNameAlreadyAssigned = await AppState.of(context)!
          .spraywallController
          .nameAlreadyAssigned(input);
      setState(() {
        _isNameAlreadyAssigned = isNameAlreadyAssigned;
      });
    } catch (e) {
      // TODO: handle error
    }
  }

  void _onSave() {
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
                    onPressed: _onSave,
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
