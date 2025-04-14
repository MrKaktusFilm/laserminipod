import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/data/database/server_connection.dart';
import 'package:user_app/domain/abstract/client_controller_abstract.dart';
import 'package:user_app/domain/abstract/language_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/abstract/server_connection_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
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
    // TODO: move to main
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
            Consumer<ClientControllerAbstract>(
              builder: (context, clientController, child) {
                return ElevatedButton(
                    onPressed: clientController.isLoading
                        ? null
                        : () {
                            _contect(_urlTextController.text);
                          },
                    child: Text('Speichern & Fortfahren'));
              },
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<ClientControllerAbstract>(
              builder: (context, clientController, child) {
                return clientController.isLoading
                    ? CircularProgressIndicator()
                    : SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _contect(String url) async {
    try {
      var clientController =
          Provider.of<ClientControllerAbstract>(context, listen: false);
      await clientController.initializeClient(url);

      String? spraywallName =
          await Provider.of<SprayWallControllerAbstract>(context, listen: false)
              .getSpraywallName();
      var serverConnectionController =
          Provider.of<ServerConnectionControllerAbstract>(context,
              listen: false);
      await serverConnectionController
          .saveConnection(ServerConnection(url, spraywallName!, true));

      if (context.mounted) {
        var navigationController =
            Provider.of<NavigationControllerAbstract>(context, listen: false);

        // set page index to 0, in case the user was on the administration page
        navigationController.setPageIndex(context, 0);
        navigationController.goToPage(AppRoute.home);
      }
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar("Verbindung fehlgeschlagen", e);
    }
  }
}
