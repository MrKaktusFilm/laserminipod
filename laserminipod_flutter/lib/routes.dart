import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/home_page.dart';
import 'package:user_app/main.dart';
import 'package:user_app/views/admin/administration_page.dart';
import 'package:user_app/views/routelist/all_routes_tab.dart';
import 'package:user_app/views/routelist/my_projects_tab.dart';
import 'package:user_app/views/routelist/my_routes_tab.dart';
import 'package:user_app/views/routelist/routelist_page.dart';
import 'package:user_app/views/spraywall/spraywall_page.dart';
import 'package:user_app/views/user/change_password_page.dart';
import 'package:user_app/views/admin/handle_management_edit_page.dart';
import 'package:user_app/views/admin/handle_management_overview_page.dart';
import 'package:user_app/views/settings/settings_page.dart';
import 'package:user_app/views/user/create_user_page.dart';
import 'package:user_app/views/user/login_page.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: AppRoute.home.fullPath,
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomePage(child: child),
      routes: [
        GoRoute(
            path: AppRoute.home.fullPath,
            builder: (context, state) => SpraywallPage()),
        ShellRoute(
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
        path: AppRoute.settings.fullPath,
        builder: (context, state) => SettingsPage()),
    AuthenticatedGoRoute(
        path: AppRoute.changePassword.fullPath,
        builder: (context, state) => ChangePasswordPage()),
  ],
);

enum AppRoute {
  home,
  administration,
  handleManagementEdit,
  handleManagementOverview,
  login,
  register,
  settings,
  changePassword,
  myprojects,
  myroutes,
  allroutes
}

extension AppRouteExtension on AppRoute {
  String get subPath {
    String name = "";
    switch (this) {
      case AppRoute.handleManagementEdit:
        name = 'handleManagementEdit';
      case AppRoute.handleManagementOverview:
        name = 'handleManagementOverview';
      case AppRoute.login:
        name = 'login';
      case AppRoute.register:
        name = 'login/register';
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
    }
    return name;
  }

  String get fullPath => '/$subPath';
}

class AuthenticatedGoRoute extends GoRoute {
  AuthenticatedGoRoute({
    required super.path,
    required Widget Function(BuildContext, GoRouterState) super.builder,
    List<GoRoute> super.routes = const [],
    bool adminNeeded = false,
  }) : super(
          redirect: (context, state) {
            final String redirect = AppRoute.login.fullPath;
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
  user,
  admin,
}
