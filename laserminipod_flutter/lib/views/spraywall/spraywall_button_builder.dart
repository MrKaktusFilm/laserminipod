import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class SpraywallButtonBuilder extends StatelessWidget {
  final String spraywallImagePath;
  final Widget Function(Handle handle) widgetFactory;

  const SpraywallButtonBuilder(
      {super.key,
      required this.spraywallImagePath,
      required this.widgetFactory});

  @override
  Widget build(BuildContext context) {
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
          UiHelper.showErrorSnackbar("An error occured");
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildFutureSpraywallButtons(
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
              top: handle.y.toDouble() - handle.radius / 2,
              left: handle.x.toDouble() - handle.radius / 2,
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
