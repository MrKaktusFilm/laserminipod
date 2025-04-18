import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:user_app/data/database/server_connection.dart';
import 'package:user_app/domain/abstract/client_controller_abstract.dart';
import 'package:user_app/domain/abstract/language_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/abstract/server_connection_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/routes.dart';
import 'package:user_app/views/dialogs/enter_server_url_dialog.dart';
import 'package:user_app/views/settings/language_dialog.dart';

class ServerSelectionPage extends StatefulWidget {
  const ServerSelectionPage({super.key});

  @override
  State<ServerSelectionPage> createState() => _ServerSelectionPageState();
}

class _ServerSelectionPageState extends State<ServerSelectionPage>
    with WidgetsBindingObserver {
  final MobileScannerController _scannerController =
      MobileScannerController(formats: [BarcodeFormat.qrCode]);
  StreamSubscription<Object?>? _subscription;
  String? _selectedUrl;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _subscription = _scannerController.barcodes.listen(_processQRCode);
    unawaited(_scannerController.start());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    _subscription = null;
    super.dispose();
    _scannerController.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // If the _scannerController is not ready, do not try to start or stop it.
    // Permission dialogs can trigger lifecycle changes before the _scannerController is ready.
    if (!_scannerController.value.hasCameraPermission) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        // Restart the scanner when the app is resumed.
        // Don't forget to resume listening to the barcode events.
        _subscription = _scannerController.barcodes.listen(_processQRCode);

        unawaited(_scannerController.start());
      case AppLifecycleState.inactive:
        // Stop the scanner when the app is paused.
        // Also stop the barcode events subscription.
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(_scannerController.stop());
    }
  }

  @override
  Widget build(BuildContext context) {
    var serverConnectionController =
        Provider.of<ServerConnectionControllerAbstract>(context, listen: false);
    final loc = UiHelper.getAppLocalization();

    return Consumer<LanguageControllerAbstract>(
        builder: (context, languageController, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(loc.selectSpraywall),
          actions: [
            IconButton(
                onPressed: () => UiHelper.showWidgetDialog(LanguageDialog()),
                icon: const Icon(Icons.language)),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              if (!kDebugMode)
                Expanded(child: MobileScanner(controller: _scannerController))
              else
                Expanded(child: Placeholder()),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Text(loc.selectExistingSpraywall),
              SizedBox(height: 20),
              FutureBuilder(
                  future: serverConnectionController.getAllConnections(),
                  builder: (context, snapshot) {
                    var entries = snapshot.data?.map((connection) {
                      return DropdownMenuEntry<String?>(
                          value: connection.serverUrl, label: connection.name);
                    }).toList();

                    return DropdownMenu<String?>(
                      label: Text(loc.spraywallDropdownLabel),
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
                      child: Text(loc.connect));
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () =>
                      UiHelper.showWidgetDialog(EnterServerUrlDialog()),
                  child: Text(loc.enterUrlManually)),
              SizedBox(
                height: 20,
              ),
              Consumer<ClientControllerAbstract>(
                builder: (context, clientController, child) {
                  return Center(
                    child: Visibility(
                      visible: clientController.isLoading,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
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
      final loc = UiHelper.getAppLocalization();
      UiHelper.showErrorSnackbar(loc.connectionFailed, e);
    }
  }

  void _processQRCode(BarcodeCapture event) {
    for (var barcode in event.barcodes) {
      if (barcode.rawValue != null) {
        _selectedUrl = barcode.rawValue;
        _connect(barcode.rawValue!);
      }
    }
  }
}
