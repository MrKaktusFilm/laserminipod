import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:user_app/common/enums/boulder_grade_enum.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/routes.dart';

class RoutelistTile extends StatefulWidget {
  const RoutelistTile({super.key, required this.route});

  final SpraywallRoute route;

  @override
  State<RoutelistTile> createState() => _RoutelistTileState();
}

class _RoutelistTileState extends State<RoutelistTile> {
  void onTap() {
    Provider.of<SprayWallControllerAbstract>(context, listen: false)
        .displayRoute(widget.route);
    Provider.of<NavigationControllerAbstract>(context, listen: false)
        .goToPage(AppRoute.home);
  }

  void onDelete() {
    Provider.of<RouteControllerAbstract>(context, listen: false)
        .openDeleteRouteDialog(widget.route.id!);
  }

  @override
  Widget build(BuildContext context) {
    var userController =
        Provider.of<UserControllerAbstract>(context, listen: false);
    return FutureBuilder(
        future: userController.getUserById(widget.route.userInfoId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var userInfo = snapshot.data;
            return ListTile(
              title: Text(widget.route.name),
              // TODO: internationalization
              subtitle: Text(
                  'Description: ${widget.route.description} \nDifficulty: ${BoulderGradeEnum.fromValue(widget.route.difficulty)!.getfbScaleName()} \nCreated at ${widget.route.creationDate} \n by ${userInfo!.userName}'),
              onTap: onTap,
              trailing: IconButton(
                  onPressed: onDelete, icon: const Icon(Icons.delete)),
            );
          }
          return SizedBox.shrink();
        });
  }
}
