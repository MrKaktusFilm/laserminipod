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
    if (userController.isSignedIn()) {
      await routeController.toggleLike(widget.routeId);
    }
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
    return Consumer<RouteControllerAbstract>(
        builder: (context, routeController, child) {
      return Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_upward),
            onPressed: _onPressed,
            color: _getColor(),
          ),
          Text(routeController.getLikeCount(widget.routeId).toString())
        ],
      );
    });
  }
}
