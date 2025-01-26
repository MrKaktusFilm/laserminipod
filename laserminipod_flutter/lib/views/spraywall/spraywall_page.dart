import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_floating_buttons.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_button.dart';

class SpraywallPage extends StatefulWidget {
  const SpraywallPage({super.key});

  @override
  State<SpraywallPage> createState() => _SpraywallPageState();
}

class _SpraywallPageState extends State<SpraywallPage> {
  @override
  Widget build(BuildContext context) {
    var viewTransformationController =
        TransformationController(Matrix4.identity()..scale(0.45));

    var controller =
        Provider.of<SprayWallControllerAbstract>(context, listen: false);

    return Stack(children: <Widget>[
      InteractiveViewer(
        transformationController: viewTransformationController,
        constrained: false,
        boundaryMargin:
            const EdgeInsets.only(), //EdgeInsets.all(double.infinity)
        minScale: 0.2,
        maxScale: 10.0,
        child: const SpraywallWithButtons(),
      ),
      if (controller.isLoading())
        const Center(child: CircularProgressIndicator()),
      Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
              onPressed: () {
                Provider.of<SprayWallControllerAbstract>(context, listen: false)
                    .openSaveRouteDialog();
              },
              child: const Icon(Icons.save))),
      Align(
        alignment: Alignment.bottomLeft,
        child: SpraywallFloatingButton(
            icon: Icons.delete,
            action:
                Provider.of<SprayWallControllerAbstract>(context, listen: false)
                    .clearCurrentRoute),
      ),
    ]);
  }
}

class SpraywallWithButtons extends StatelessWidget {
  const SpraywallWithButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/img/spraywall_example.jpg',
            fit: BoxFit.fitHeight,
          ),
          FutureBuilder<List<Handle>>(
            future:
                Provider.of<SprayWallControllerAbstract>(context, listen: false)
                    .loadAllHandles(),
            builder: (context, AsyncSnapshot<List<Handle>> snapshot) {
              if (snapshot.hasData) {
                List<Widget> positionedHandles = snapshot.data!.map((handle) {
                  return Positioned(
                    bottom: handle.x.toDouble(),
                    right: handle.y.toDouble(),
                    child: Consumer<SprayWallControllerAbstract>(
                        builder: (context, spraywallController, child) {
                      return SpraywallHandleButton(id: handle.id!);
                    }),
                  );
                }).toList();

                // sizedBox necessary to limit Stacks size
                return SizedBox(
                    width: 1000.0,
                    height: 1000.0,
                    child: Stack(children: positionedHandles));
              } else if (Provider.of<SprayWallControllerAbstract>(context,
                      listen: false)
                  .isLoading()) {
                return const Center(child: CircularProgressIndicator());
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}
