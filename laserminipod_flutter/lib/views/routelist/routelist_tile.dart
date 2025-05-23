import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:provider/provider.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:user_app/common/enums/boulder_grade_enum.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/routes.dart';
import 'package:user_app/views/routelist/route_like_button.dart';

class RoutelistTile extends StatefulWidget {
  const RoutelistTile({super.key, required this.route});

  final SpraywallRoute route;

  @override
  State<RoutelistTile> createState() => _RoutelistTileState();
}

class _RoutelistTileState extends State<RoutelistTile> {
  void onTap() {
    Provider.of<RouteControllerAbstract>(context, listen: false)
        .displayRoute(widget.route.id!);
    Provider.of<NavigationControllerAbstract>(context, listen: false)
        .goToPage(AppRoute.home);
  }

  void onDelete() {
    Provider.of<RouteControllerAbstract>(context, listen: false)
        .openDeleteRouteDialog(widget.route.id!);
  }

  void onAddToProjects() {
    Provider.of<RouteControllerAbstract>(context, listen: false)
        .addProjectForUser(widget.route.id!);
  }

  void onRemoveFromProjects() {
    Provider.of<RouteControllerAbstract>(context, listen: false)
        .deleteProjectForUser(widget.route.id!);
  }

  void onAddToSents() {
    Provider.of<RouteControllerAbstract>(context, listen: false)
        .addSentForUser(widget.route.id!);
  }

  void onRemoveFromSents() {
    Provider.of<RouteControllerAbstract>(context, listen: false)
        .deleteSentForUser(widget.route.id!);
  }

  @override
  Widget build(BuildContext context) {
    var userController =
        Provider.of<UserControllerAbstract>(context, listen: false);
    var routeController =
        Provider.of<RouteControllerAbstract>(context, listen: false);
    final loc = UiHelper.getAppLocalization();
    return FutureBuilder(
        future: userController.getUserById(widget.route.userInfoId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var userInfo = snapshot.data;
            bool isProject = false;
            bool isSent = false;
            bool isCreator = false;

            if (userController.isSignedIn()) {
              isProject =
                  routeController.getMyProjects().contains(widget.route);
              isSent = routeController.isSent(widget.route.id!);
              isCreator =
                  userController.getSignedInUserId() == widget.route.userInfoId;
            }
            return Card(
              color: isSent ? const Color.fromARGB(255, 156, 241, 158) : null,
              child: Column(
                children: [
                  ListTile(
                    leading: FutureBuilder(
                        future:
                            userController.getUserById(widget.route.userInfoId),
                        builder: (context, snapshot) {
                          return CircularUserImage(
                            userInfo: snapshot.data,
                            size: 50.0,
                          );
                        }),
                    title: Text(widget.route.name),
                    // TODO: internationalization
                    subtitle: Text(
                        'Description: ${widget.route.description} \nDifficulty: ${BoulderGradeEnum.fromValue(widget.route.difficulty)!.getfbScaleName()} \nCreated at ${widget.route.creationDate} \n by ${userInfo!.userName}'),
                    onTap: onTap,
                    trailing: userController.isSignedIn()
                        ? PopupMenuButton<String>(
                            onSelected: (value) {
                              switch (value) {
                                case 'delete':
                                  onDelete();
                                  break;
                                case 'addToProjects':
                                  isProject
                                      ? onRemoveFromProjects()
                                      : onAddToProjects();
                                  break;
                                case 'addToSents':
                                  isSent ? onRemoveFromSents() : onAddToSents();
                                  break;
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                if (isCreator ||
                                    userController.hasAdminRights())
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: ListTile(
                                      leading: Icon(Icons.delete),
                                      title: Text(loc.delete),
                                    ),
                                  ),
                                PopupMenuItem(
                                  value: 'addToProjects',
                                  child: ListTile(
                                    leading: Icon(
                                        isProject ? Icons.remove : Icons.add),
                                    title: Text(isProject
                                        ? loc.removeFromProjects
                                        : loc.addToProjects),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'addToSents',
                                  child: ListTile(
                                    leading: Icon(
                                        isSent ? Icons.close : Icons.check),
                                    title: Text(!isSent
                                        ? loc.addToSents
                                        : loc.removeFromSents),
                                  ),
                                ),
                              ];
                            },
                          )
                        : null,
                  ),
                  RouteLikeButton(routeId: widget.route.id!),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        });
  }
}
