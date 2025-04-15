import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/data/database/server_connection.dart';
import 'package:user_app/domain/abstract/client_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/abstract/server_connection_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/routes.dart';

class EnterServerUrlDialog extends StatefulWidget {
  const EnterServerUrlDialog({super.key});

  @override
  State<EnterServerUrlDialog> createState() => _EnterServerUrlDialogState();
}

class _EnterServerUrlDialogState extends State<EnterServerUrlDialog> {
  final TextEditingController _urlTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loc = UiHelper.getAppLocalization();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _urlTextController,
                decoration: InputDecoration(labelText: 'Server-URL eingeben'),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Consumer<ClientControllerAbstract>(
                    builder: (context, clientController, child) {
                      return TextButton(
                          onPressed: clientController.isLoading
                              ? null
                              : () {
                                  _connect(_urlTextController.text);
                                },
                          child: Text('Speichern & Fortfahren'));
                    },
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

  Future<void> _connect(String url) async {
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

        navigationController.closeCurrentScreen(context);
        // set page index to 0, in case the user was on the administration page
        navigationController.setPageIndex(context, 0);
        navigationController.goToPage(AppRoute.home);
      }
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar("Verbindung fehlgeschlagen", e);
    }
  }
}
