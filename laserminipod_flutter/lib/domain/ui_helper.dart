import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    TransformationController viewTransformationController,
    Widget Function(Handle handle) widgetFactory,
  ) {
    return InteractiveViewer(
      transformationController: viewTransformationController,
      constrained: false,
      boundaryMargin: EdgeInsets.all(double.infinity),
      minScale: 0.2,
      maxScale: 10.0,
      child: GestureDetector(
        onTapDown: (details) {
          var width = context.size!.width;
          var height = context.size!.height;
          print(details.localPosition);
          print("$width | $height");
        },
        child: LimitedBox(
          child: Container(
              color: Colors.black,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: <Widget>[
                  Image.asset(
                    'assets/img/spraywall_example.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                  FutureBuilder<(int, int)>(
                      future: Provider.of<SprayWallControllerAbstract>(context,
                              listen: false)
                          .getImageDimensions(
                        '/../../assets/img/spraywall_example.jpg',
                      ),
                      builder: (
                        context,
                        AsyncSnapshot<(int, int)> snapshot,
                      ) {
                        if (snapshot.hasData) {
                          return _buildSpraywallButtons(
                              context, widgetFactory, snapshot.data!);
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          showErrorSnackbar("An error occured");
                        }
                        return const SizedBox.shrink();
                      })
                ],
              )),
        ),
      ),
    );
  }

  static Widget _buildSpraywallButtons(
    BuildContext context,
    Widget Function(Handle handle) widgetFactory,
    (int, int) imageDimensions,
  ) {
    return FutureBuilder<List<Handle>>(
      future: Provider.of<SprayWallControllerAbstract>(context, listen: false)
          .loadAllHandles(),
      builder: (
        context,
        AsyncSnapshot<List<Handle>> snapshot,
      ) {
        // TODO: FutureBuilder für Image Größe
        if (snapshot.hasData) {
          List<Widget> positionedHandles = snapshot.data!.map((handle) {
            return Positioned(
              top: handle.x.toDouble(),
              left: handle.y.toDouble(),
              child: Consumer<SprayWallControllerAbstract>(
                builder: (context, spraywallController, child) =>
                    widgetFactory(handle),
              ),
            );
          }).toList();

          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: imageDimensions.$1.toDouble(),
              maxHeight: imageDimensions.$2.toDouble(),
            ),
            child: Stack(
              children: positionedHandles,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          showErrorSnackbar("An error occured");
        }
        return const SizedBox.shrink();
      },
    );
  }

  static Future<(int, int)> _loadImageDimensions() async {
    File image =
        new File('image.png'); // Or any other way to get a File instance.
    var decodedImage = await decodeImageFromList(image.readAsBytesSync());
    return (decodedImage.width, decodedImage.height);
  }
}
