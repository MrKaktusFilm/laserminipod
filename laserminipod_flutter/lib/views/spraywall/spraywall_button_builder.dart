import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/domain/abstract/image_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';

class SpraywallButtonBuilder extends StatelessWidget {
  final Widget Function(Handle handle) widgetFactory;

  const SpraywallButtonBuilder({super.key, required this.widgetFactory});

  @override
  Widget build(BuildContext context) {
    var imageDimensions =
        Provider.of<ImageControllerAbstract>(context, listen: false)
            .imageDimensions;
    // if in admin edit mode, this is the handle that is currently edited
    // = null, if added new handle
    var excludedHandleId =
        Provider.of<HandleControllerAbstract>(context, listen: false)
            .selectedHandleId;
    return FutureBuilder<List<Handle>>(
      future: Provider.of<HandleControllerAbstract>(context, listen: false)
          .loadAllHandles(),
      builder: (
        context,
        AsyncSnapshot<List<Handle>> snapshot,
      ) {
        if (snapshot.hasData) {
          Iterable<Handle> data = snapshot.data!;
          if (excludedHandleId != null) {
            data = data.where((handle) => handle.id != excludedHandleId);
          }
          List<Widget> positionedHandles = data.map((handle) {
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
              maxWidth: imageDimensions!.$1.toDouble(),
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
