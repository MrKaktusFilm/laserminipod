import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';

class RouteLikeButton extends StatefulWidget {
  final int routeId;

  const RouteLikeButton({super.key, required this.routeId});

  @override
  State<RouteLikeButton> createState() => _RouteLikeButtonState();
}

class _RouteLikeButtonState extends State<RouteLikeButton> {
  late final UserControllerAbstract userController;
  late final RouteControllerAbstract routeController;

  Future<void> _onPressed() async {
    await routeController.toggleLike(widget.routeId);
  }

  Color _getColor() {
    if (userController.isSignedIn()) {
      return routeController.isLiked(widget.routeId) ? Colors.red : Colors.grey;
    } else {
      return Colors.grey;
    }
  }

  @override
  void initState() {
    userController =
        Provider.of<UserControllerAbstract>(context, listen: false);
    routeController =
        Provider.of<RouteControllerAbstract>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isSignedIn = userController.isSignedIn();

    return Consumer<RouteControllerAbstract>(
        builder: (context, routeController, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(Icons.thumb_up_alt),
            onPressed: isSignedIn ? _onPressed : null,
            color: _getColor(),
          ),
          FutureBuilder(
              future: routeController.getLikeCount(widget.routeId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('${snapshot.data}');
                } else {
                  return Text('?');
                }
              }),
          SizedBox(width: 10),
        ],
      );
    });
  }
}
