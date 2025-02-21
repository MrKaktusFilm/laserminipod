import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    var temp = await Provider.of<UserControllerAbstract>(context, listen: false)
        .logIn(_emailController.text, _passwordController.text, context);

    setState(() {
      _errorMessage = temp;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final adminController =
        Provider.of<UserControllerAbstract>(context, listen: false);
    final loc = UiHelper.getAppLocalization(); // Zugriff auf Lokalisierungen

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.adminLoginTitle), // Verwendung der Lokalisierung
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                      return loc.invalidEmail; // Verwendung der Lokalisierung
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: loc.password, // Verwendung der Lokalisierung
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return loc.enterPassword; // Verwendung der Lokalisierung
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
                const SizedBox(height: 16.0),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _login,
                        child: Text(loc.login), // Verwendung der Lokalisierung
                      ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _register,
                  child: Text(loc.register), // Verwendung der Lokalisierung
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() {
    var navigationController =
        Provider.of<NavigationControllerAbstract>(context, listen: false);
    navigationController.pushPage(context, AppRoute.register);
  }
}
