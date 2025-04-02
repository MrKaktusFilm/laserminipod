import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/client_controller_abstract.dart';
import 'package:user_app/domain/abstract/language_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/main.dart';
import 'package:user_app/routes.dart';

class ServerSelectionPage extends StatefulWidget {
  const ServerSelectionPage({super.key});

  @override
  State<ServerSelectionPage> createState() => _ServerSelectionPageState();
}

class _ServerSelectionPageState extends State<ServerSelectionPage> {
  final TextEditingController _urlTextController = TextEditingController();

  @override
  void initState() {
    var languageController =
        Provider.of<LanguageControllerAbstract>(context, listen: false);
    languageController.initLanguage();
    _urlTextController.text = serverURL;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Server auswählen')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _urlTextController,
              decoration: InputDecoration(labelText: 'Server-URL eingeben'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _contect, child: Text('Speichern & Fortfahren'))
          ],
        ),
      ),
    );
  }

  Future<void> _contect() async {
    var clientController =
        Provider.of<ClientControllerAbstract>(context, listen: false);
    // TODO: error handling
    await clientController.initializeClient(_urlTextController.text);

    var navigationController =
        Provider.of<NavigationControllerAbstract>(context, listen: false);
    navigationController.pushPage(context, AppRoute.home);
  }
}
