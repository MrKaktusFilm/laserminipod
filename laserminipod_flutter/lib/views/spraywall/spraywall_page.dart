import 'package:flutter/material.dart';
import 'package:user_app/views/dialogs/save_route_dialog.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_floating_buttons.dart';
import 'package:user_app/views/spraywall/buttons/spraywall_handle_button.dart';
import 'package:user_app/home.dart';

class SpraywallPage extends StatefulWidget {
  const SpraywallPage({super.key});

  @override
  State<SpraywallPage> createState() => _SpraywallPageState();
}

class _SpraywallPageState extends State<SpraywallPage> {
  void onSave() {
    if (AppState.of(context)!.spraywallController.existsCurrentRouteAlready()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Die erstellte Route existiert bereits.")));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => const SaveRouteDialog());
    }
  }

  @override
  Widget build(BuildContext context) {
    var viewTransformationController =
        TransformationController(Matrix4.identity()..scale(0.45));

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
      Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
              onPressed: onSave, child: const Icon(Icons.save))),
      Align(
        alignment: Alignment.bottomLeft,
        child: SpraywallFloatingButton(
            icon: Icons.delete,
            action:
                AppState.of(context)!.spraywallController.clearCurrentRoute),
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
          for (int i = 0; i < 4; i++)
            Positioned(
              bottom: 70 * i + 10,
              right: 100,
              child: ListenableBuilder(
                  listenable: AppState.of(context)!.spraywallController,
                  builder: (context, _) {
                    return SpraywallHandleButton(id: i);
                  }),
            )
        ],
      ),
    );
  }
}
