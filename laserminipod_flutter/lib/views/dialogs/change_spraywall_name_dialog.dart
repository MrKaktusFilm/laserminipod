import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/constants.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class ChangeSpraywallNameDialog extends StatefulWidget {
  const ChangeSpraywallNameDialog({super.key});

  @override
  State<ChangeSpraywallNameDialog> createState() =>
      _ChangeSpraywallNameDialogState();
}

class _ChangeSpraywallNameDialogState extends State<ChangeSpraywallNameDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  String? _newSpraywallName;

  @override
  Widget build(BuildContext context) {
    var loc = UiHelper.getAppLocalization();
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                maxLength: maxTextfieldInputLength,
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: loc.spraywallName,
                  filled: true,
                ),
                onChanged: (value) {
                  setState(() {
                    _newSpraywallName = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return loc.enterName;
                  }
                  return null;
                },
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

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      final spraywallController =
          Provider.of<SprayWallControllerAbstract>(context, listen: false);
      spraywallController.setSpraywallName(_newSpraywallName!.trim());
      Navigator.pop(context);
    }
  }
}
