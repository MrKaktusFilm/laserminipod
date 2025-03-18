import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/constants.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class ChangeUsernameDialog extends StatefulWidget {
  const ChangeUsernameDialog({super.key});

  @override
  State<ChangeUsernameDialog> createState() => _ChangeUsernameDialogState();
}

class _ChangeUsernameDialogState extends State<ChangeUsernameDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _textEditingController;
  String? _newUserName;

  @override
  void initState() {
    String currentUserName =
        Provider.of<UserControllerAbstract>(context, listen: false)
            .getSignedInUserName()!;
    _textEditingController = TextEditingController()..text = currentUserName;
    super.initState();
  }

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
                  labelText: loc.newUserName,
                  filled: true,
                ),
                onChanged: (value) {
                  setState(() {
                    _newUserName = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return loc.enterUsername;
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
      final userController =
          Provider.of<UserControllerAbstract>(context, listen: false);
      userController.setUserName(_newUserName!.trim());
      Navigator.pop(context);
    }
  }
}
