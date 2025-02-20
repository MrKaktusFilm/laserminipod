import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    if (_formKey.currentState!.validate()) {
      var adminController =
          Provider.of<UserControllerAbstract>(context, listen: false);
      String? errorMessage = await adminController.changePasswordIfValid(
          _currentPasswordController.text, _newPasswordController.text);
      setState(() {
        _errorMessage = errorMessage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var adminController =
        Provider.of<UserControllerAbstract>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(UiHelper.getAppLocalization().changePasswordPageTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _currentPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: UiHelper.getAppLocalization()
                      .changePasswordPageCurrentTextFieldLabel,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return UiHelper.getAppLocalization()
                        .changePasswordPageValidatorEmpty;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: UiHelper.getAppLocalization()
                      .changePasswordPageNewTextFieldLabel,
                ),
                validator: (value) =>
                    adminController.validateNewPasswordRequirements(value),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: UiHelper.getAppLocalization()
                      .changePasswordPageConfirmTextFieldLabel,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return UiHelper.getAppLocalization()
                        .changePasswordPageValidatorConfirmEmpty;
                  } else if (value != _newPasswordController.text) {
                    return UiHelper.getAppLocalization()
                        .changePasswordPageValidatorConfirmNoMatch;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _changePassword,
                child: Text(
                    UiHelper.getAppLocalization().changePasswordPageButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
