import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/data/database/server_connection.dart';
import 'package:user_app/domain/abstract/client_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/abstract/server_connection_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/main.dart';
import 'package:user_app/routes.dart';
import 'package:user_app/views/dialogs/enter_server_url_dialog.dart';

class ServerSelectionPage extends StatefulWidget {
  const ServerSelectionPage({super.key});

  @override
  State<ServerSelectionPage> createState() => _ServerSelectionPageState();
}

class _ServerSelectionPageState extends State<ServerSelectionPage> {
  String? _selectedUrl;

  @override
  Widget build(BuildContext context) {
    var serverConnectionController =
        Provider.of<ServerConnectionControllerAbstract>(context, listen: false);
    var loc = UiHelper.getAppLocalization();

    return Scaffold(
      appBar: AppBar(title: Text('Server auswählen')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            FutureBuilder(
                future: serverConnectionController.getAllConnections(),
                builder: (context, snapshot) {
                  var entries = snapshot.data?.map((connection) {
                    return DropdownMenuEntry<String?>(
                        value: connection.serverUrl, label: connection.name);
                  }).toList();

                  return DropdownMenu<String?>(
                    label: Text('Spraywall auswählen'),
                    enableSearch: false,
                    requestFocusOnTap: false,
                    dropdownMenuEntries: entries ?? [],
                    onSelected: (url) => setState(() {
                      _selectedUrl = url;
                    }),
                    expandedInsets: EdgeInsets.all(8.0),
                  );
                }),
            SizedBox(height: 20),
            Consumer<ClientControllerAbstract>(
              builder: (context, clientController, child) {
                return ElevatedButton(
                    onPressed:
                        clientController.isLoading || _selectedUrl == null
                            ? null
                            : () {
                                _connect(_selectedUrl!);
                              },
                    child: Text('Speichern & Fortfahren'));
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () =>
                    UiHelper.showWidgetDialog(EnterServerUrlDialog()),
                child: Text('URL manuell eingeben')),
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

        // set page index to 0, in case the user was on the administration page
        navigationController.setPageIndex(context, 0);
        navigationController.goToPage(AppRoute.home);
      }
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar("Verbindung fehlgeschlagen", e);
    }
  }
}
