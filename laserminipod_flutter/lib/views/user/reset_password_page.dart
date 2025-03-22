import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:user_app/constants.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/routes.dart';
import 'package:user_app/views/user/password_textfield.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  final loc = UiHelper.getAppLocalization();
  late UserControllerAbstract _userController;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;
  bool _showPasswordResetUI = false;
  String? _validationCode;
  bool _isValidationCodeCompleted = false;
  String? _sentEmail;

  @override
  void initState() {
    _userController =
        Provider.of<UserControllerAbstract>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.register),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Form(
              key: _emailFormKey,
              child: TextFormField(
                maxLength: maxEmailLength,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: loc.email, // Verwendung der Lokalisierung
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return loc.enterEmail; // Verwendung der Lokalisierung
                  }
                  if (!_userController.isValidEmail(value)) {
                    return loc.invalidEmail;
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: _sendValidationCode,
              child: Text(loc.requestCode), // Localized text
            ),
            SizedBox(height: 64.0),
            if (_showPasswordResetUI) ...[
              Form(
                key: _passwordFormKey,
                child: PasswordTextField(
                  controller: _passwordController,
                  labelText: loc.enterNewPassword,
                  validator: (value) =>
                      _userController.validatePasswordRequirements(value),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(loc.enterValidationCode(_sentEmail!)),
              PinCodeTextField(
                appContext: context,
                length: 8,
                onChanged: _onChange,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _isValidationCodeCompleted ? _resetPassword : null,
                child: Text(loc.resetPassword), // Localized text
              ),
            ],
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _resetPassword() async {
    if (!_passwordFormKey.currentState!.validate()) {
      return;
    }

    String? errorMessage = await _userController.resetPassword(
        _validationCode!, _emailController.text, _passwordController.text);
    setState(() {
      _errorMessage = errorMessage;
    });
    if (errorMessage == null && context.mounted) {
      Provider.of<NavigationControllerAbstract>(context, listen: false)
          .goToPage(AppRoute.login);
    }
  }

  Future<void> _sendValidationCode() async {
    if (!_emailFormKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _errorMessage = null;
      _showPasswordResetUI = false;
    });
    String? errorMessage = await _userController
        .sendPasswordResetValidationCode(_emailController.text);
    setState(() {
      _errorMessage = errorMessage;
      if (errorMessage == null) {
        _showPasswordResetUI = true;
        _sentEmail = _emailController.text;
      } else {
        _sentEmail = null;
      }
    });
  }

  void _onChange(String input) {
    setState(() {
      if (input.length == 8) {
        _isValidationCodeCompleted = true;
      } else {
        _isValidationCodeCompleted = false;
      }
      _validationCode = input;
    });
  }
}
