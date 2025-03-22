import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:flutter_verification_code_field/flutter_verification_code_field.dart';
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
  final _formKey = GlobalKey<FormState>();
  final loc = UiHelper.getAppLocalization();
  late UserControllerAbstract _userController;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;
  bool _showPasswordResetUI = false;
  String? _validationCode;
  bool _isValidationCodeCompleted = false;

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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // TextFormField(
              //   maxLength: maxTextfieldInputLength,
              //   controller: _userNameController,
              //   decoration: InputDecoration(
              //     labelText: loc.username, // Verwendung der Lokalisierung
              //   ),
              //   validator: (value) {
              //     if (value == null || value.trim().isEmpty) {
              //       return loc.enterUsername;
              //     }
              //     return null;
              //   },
              // ),
              SizedBox(height: 16.0),
              TextFormField(
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
              ElevatedButton(
                onPressed: _sendValidationCode,
                child: Text('Code anfordern'),
              ),
              SizedBox(height: 64.0),
              if (_showPasswordResetUI) ...[
                PasswordTextField(
                  controller: _passwordController,
                  labelText: loc.enterNewPassword,
                  validator: (value) =>
                      _userController.validatePasswordRequirements(value),
                ),
                const SizedBox(height: 16.0),
                // VerificationCodeField(length: 8),
                // VerificationCode(
                //     itemSize: 40,
                //     keyboardType: TextInputType.text,
                //     length: 8,
                //     onCompleted: _onCompleted,
                //     onEditing: _onEditing),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _isValidationCodeCompleted ? _resetPassword : null,
                  child: Text('Passwort zurücksetzen'),
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
      ),
    );
  }

  Future<void> _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      String? errorMessage = await _userController.resetPassword(
          '', _emailController.text, _passwordController.text);
      setState(() {
        _errorMessage = errorMessage;
      });
      if (errorMessage == null && context.mounted) {
        Provider.of<NavigationControllerAbstract>(context, listen: false)
            .goToPage(AppRoute.login);
      }
    }
  }

  Future<void> _sendValidationCode() async {
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
      }
    });
  }

  void _onCompleted(String value) {
    setState(() {
      _isValidationCodeCompleted = true;
      _validationCode = value;
    });
  }

  void _onEditing(bool value) {
    setState(() {
      _isValidationCodeCompleted = false;
    });
  }
}
