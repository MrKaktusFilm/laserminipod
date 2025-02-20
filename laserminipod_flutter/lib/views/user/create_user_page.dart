import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _createUser() async {
    if (_formKey.currentState!.validate()) {
      // var adminController =
      //     Provider.of<AdminControllerAbstract>(context, listen: false);
      String? errorMessage = "";
      setState(() {
        _errorMessage = errorMessage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var adminController =
        Provider.of<UserControllerAbstract>(context, listen: false);
    var loc = UiHelper.getAppLocalization();

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
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: loc.username, // Verwendung der Lokalisierung
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return loc.enterUsername;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: loc.email, // Verwendung der Lokalisierung
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return loc.enterEmail; // Verwendung der Lokalisierung
                  }
                  if (!adminController.isValidEmail(value)) {
                    return loc.invalidEmail;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: loc.enterPassword,
                ),
                validator: (value) =>
                    adminController.validatePasswordRequirements(value),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: loc.changePasswordPageConfirmTextFieldLabel,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return loc.confirmPassword;
                  } else if (value != _passwordController.text) {
                    return loc.changePasswordPageValidatorConfirmNoMatch;
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
                onPressed: _createUser,
                child: Text(loc.register),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
