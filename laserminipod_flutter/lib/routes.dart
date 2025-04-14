import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/client_controller_abstract.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/main.dart';
import 'package:user_app/views/admin/administration_page.dart';
import 'package:user_app/views/home_page.dart';
import 'package:user_app/views/routelist/all_routes_tab.dart';
import 'package:user_app/views/routelist/my_projects_tab.dart';
import 'package:user_app/views/routelist/my_routes_tab.dart';
import 'package:user_app/views/routelist/routelist_page.dart';
import 'package:user_app/views/server_selection_page.dart';
import 'package:user_app/views/spraywall/spraywall_page.dart';
import 'package:user_app/views/user/change_password_page.dart';
import 'package:user_app/views/admin/handle_management_edit_page.dart';
import 'package:user_app/views/admin/handle_management_overview_page.dart';
import 'package:user_app/views/settings/settings_page.dart';
import 'package:user_app/views/user/create_user_page.dart';
import 'package:user_app/views/user/login_page.dart';
import 'package:user_app/views/user/reset_password_page.dart';

GoRouter getGoRouter(AppRoute initialLocation) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: initialLocation.fullPath,
    routes: [
      ShellRoute(
        builder: (context, state, child) => HomePage(child: child),
        routes: [
          GoRoute(
              path: AppRoute.home.fullPath,
              builder: (context, state) => SpraywallPage()),
          ShellRoute(
            redirect: (context, state) {
              // redirect user to previous selected tab
              final routeController =
                  Provider.of<RouteControllerAbstract>(context, listen: false);
              return routeController.tabRedirect(context, state);
            },
            builder: (context, state, child) {
              return RouteListPage(child: child);
            },
            routes: [
              GoRoute(
                path: AppRoute.myprojects.fullPath,
                builder: (context, state) => MyProjectsTab(),
              ),
              GoRoute(
                path: AppRoute.myroutes.fullPath,
                builder: (context, state) => MyRoutesTab(),
              ),
              GoRoute(
                path: AppRoute.allroutes.fullPath,
                builder: (context, state) => AllRoutesTab(),
              ),
            ],
          ),
          GoRoute(
              path: AppRoute.allroutesGuest.fullPath,
              builder: (context, state) => AllRoutesTab()),
          AuthenticatedGoRoute(
              path: AppRoute.administration.fullPath,
              builder: (context, state) => AdministrationPage()),
        ],
      ),
      AuthenticatedGoRoute(
          path: AppRoute.handleManagementEdit.fullPath,
          builder: (context, state) => HandleManagementEditPage(),
          adminNeeded: true),
      AuthenticatedGoRoute(
          path: AppRoute.handleManagementOverview.fullPath,
          builder: (context, state) => HandleManagementOverviewPage(),
          adminNeeded: true),
      GoRoute(
        path: AppRoute.login.fullPath,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
          path: AppRoute.register.fullPath,
          builder: (context, state) => CreateUserPage()),
      GoRoute(
          path: AppRoute.resetPassword.fullPath,
          builder: (context, state) => ResetPasswordPage()),
      GoRoute(
          path: AppRoute.settings.fullPath,
          builder: (context, state) => SettingsPage()),
      AuthenticatedGoRoute(
          path: AppRoute.changePassword.fullPath,
          builder: (context, state) => ChangePasswordPage()),
      GoRoute(
          path: AppRoute.serverSelection.fullPath,
          builder: (context, state) => ServerSelectionPage()),
    ],
  );
}

enum AppRoute {
  serverSelection,
  home,
  administration,
  handleManagementEdit,
  handleManagementOverview,
  login,
  register,
  resetPassword,
  settings,
  changePassword,
  myprojects,
  myroutes,
  allroutes,
  allroutesGuest,
}

extension AppRouteExtension on AppRoute {
  String get subPath {
    String name = "";
    switch (this) {
      case AppRoute.handleManagementEdit:
        name = 'handleManagementOverview/handleManagementEdit';
      case AppRoute.handleManagementOverview:
        name = 'handleManagementOverview';
      case AppRoute.login:
        name = 'login';
      case AppRoute.register:
        name = 'login/register';
      case AppRoute.resetPassword:
        name = 'login/reset';
      case AppRoute.settings:
        name = 'settings';
      case AppRoute.changePassword:
        name = 'settings/changePassword';
      case AppRoute.home:
        name = 'home';
      case AppRoute.myprojects:
        name = 'myprojects';
      case AppRoute.myroutes:
        name = 'myroutes';
      case AppRoute.allroutes:
        name = 'allroutes';
      case AppRoute.administration:
        name = 'administration';
      case AppRoute.allroutesGuest:
        name = 'allroutesGuest';
      case AppRoute.serverSelection:
        name = 'serverSelection';
    }
    return name;
  }

  String get fullPath => '/$subPath';
}

class AuthenticatedGoRoute extends GoRoute {
  AuthenticatedGoRoute(
      {required super.path,
      required Widget Function(BuildContext, GoRouterState) super.builder,
      List<GoRoute> super.routes = const [],
      bool adminNeeded = false,
      String? redirect})
      : super(
          redirect: (context, state) {
            var clientController =
                Provider.of<ClientControllerAbstract>(context, listen: false);
            var sessionManager = clientController.sessionManager;

            redirect ??= AppRoute.login.fullPath;
            if (!sessionManager.isSignedIn) {
              UiHelper.showSnackbar(
                  UiHelper.getAppLocalization().loginRequired, Colors.red);
              return redirect;
            }
            if (!adminNeeded) return null;
            final isAuthenticated = sessionManager.signedInUser!.scopeNames
                .contains(Scopes.admin.name);
            if (isAuthenticated) {
              return null;
            } else {
              UiHelper.showSnackbar(
                  UiHelper.getAppLocalization().adminRequired, Colors.red);
              return AppRoute.home.subPath;
            }
          },
        );
}

enum Scopes {
  guest,
  user,
  admin,
  useronly, // not accessable for admins
}
