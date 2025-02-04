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
      TransformationController viewTransformationController,
      Widget Function(Handle handle) widgetFactory) {
    return _buildBaseSpraywallPanel(
      context,
      viewTransformationController,
      widgetFactory,
    );
  }

  static Widget _buildBaseSpraywallPanel(
      BuildContext context,
      TransformationController viewTransformationController,
      Widget Function(Handle handle) widgetFactory) {
    var spraywallImagePath = 'assets/img/spraywall_example.jpg';

    return InteractiveViewer(
      transformationController: viewTransformationController,
      constrained: false,
      boundaryMargin: EdgeInsets.all(double.infinity),
      minScale: 0.2,
      maxScale: 10.0,
      child: LimitedBox(
        child: Container(
          color: Colors.black,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              Image.asset(
                spraywallImagePath,
                fit: BoxFit.fitHeight,
              ),
              _buildFutureImage(context, spraywallImagePath, widgetFactory),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildFutureImage(
    BuildContext context,
    String spraywallImagePath,
    Widget Function(Handle handle) widgetFactory,
  ) {
    return FutureBuilder<(int, int)>(
      future: Provider.of<SprayWallControllerAbstract>(context, listen: false)
          .getImageDimensions(spraywallImagePath),
      builder: (
        context,
        AsyncSnapshot<(int, int)> snapshot,
      ) {
        if (snapshot.hasData) {
          return _buildFutureSpraywallButtons(
              context, widgetFactory, snapshot.data!);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          showErrorSnackbar("An error occured");
        }
        return const SizedBox.shrink();
      },
    );
  }

  static Widget _buildFutureSpraywallButtons(
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
        }
        return const SizedBox.shrink();
      },
    );
  }
}
