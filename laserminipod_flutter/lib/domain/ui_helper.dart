import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/main.dart';

class UiHelper {
  static void showSnackbar(String message, Color color) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  static void showErrorSnackbar(String message) {
    showSnackbar(message, Colors.red);
  }

  static void showWidgetDialog(Widget dialog) {
    final context = navigatorKey.currentState?.overlay?.context;
    showDialog(
      context: context!,
      builder: (BuildContext context) => dialog,
    );
  }

  static Widget getSpraywallPanel(
    BuildContext context,
    Widget Function(Handle handle)
        widgetFactory, // Factory-Funktion als Parameter
  ) {
    var viewTransformationController =
        TransformationController(Matrix4.identity()..scale(0.45));

    return InteractiveViewer(
      transformationController: viewTransformationController,
      constrained: false,
      boundaryMargin:
          const EdgeInsets.only(), // EdgeInsets.all(double.infinity)
      minScale: 0.2,
      maxScale: 10.0,
      child: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/img/spraywall_example.jpg',
              fit: BoxFit.fitHeight,
            ),
            FutureBuilder<List<Handle>>(
              future: Provider.of<SprayWallControllerAbstract>(context,
                      listen: false)
                  .loadAllHandles(),
              builder: (context, AsyncSnapshot<List<Handle>> snapshot) {
                // loads all handles to the panel
                if (snapshot.hasData) {
                  List<Widget> positionedHandles = snapshot.data!.map((handle) {
                    return Positioned(
                        bottom: handle.x.toDouble(),
                        right: handle.y.toDouble(),
                        child: Consumer<SprayWallControllerAbstract>(
                          builder: (context, spraywallController, child) =>
                              widgetFactory(
                                  handle), // Erzeugt das Widget dynamisch
                        ));
                  }).toList();

                  // SizedBox necessary to limit Stack's size
                  return SizedBox(
                      width: 1000.0,
                      height: 1000.0,
                      child: Stack(children: positionedHandles));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  showErrorSnackbar("An error occured");
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
