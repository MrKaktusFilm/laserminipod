import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/home.dart';
import 'package:user_app/main.dart';
import 'package:user_app/views/admin/change_password_page.dart';
import 'package:user_app/views/admin/handle_management_edit_page.dart';
import 'package:user_app/views/admin/handle_management_overview_page.dart';
import 'package:user_app/views/settings/settings_page.dart';
import 'package:user_app/views/user/create_user_page.dart';
import 'package:user_app/views/user/login_page.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: AppRoute.home.subPath,
      builder: (context, state) => HomePage(),
      routes: [
        AuthenticatedGoRoute(
            path: AppRoute.handleManagementEdit.subPath,
            builder: (context, state) => HandleManagementEditPage(),
            adminNeeded: true),
        AuthenticatedGoRoute(
            path: AppRoute.handleManagementOverview.subPath,
            builder: (context, state) => HandleManagementOverviewPage(),
            adminNeeded: true),
        GoRoute(
          path: AppRoute.login.subPath,
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
            path: AppRoute.register.subPath,
            builder: (context, state) => CreateUserPage()),
        GoRoute(
            path: AppRoute.settings.subPath,
            builder: (context, state) => SettingsPage()),
        AuthenticatedGoRoute(
            path: AppRoute.changePassword.subPath,
            builder: (context, state) => ChangePasswordPage()),
      ],
    ),
  ],
);

enum AppRoute {
  home,
  handleManagementEdit,
  handleManagementOverview,
  login,
  register,
  settings,
  changePassword,
}

extension AppRouteExtension on AppRoute {
  String get subPath {
    switch (this) {
      case AppRoute.handleManagementEdit:
        return 'handleManagementEdit';
      case AppRoute.handleManagementOverview:
        return 'handleManagementOverview';
      case AppRoute.login:
        return 'login';
      case AppRoute.register:
        return 'login/register';
      case AppRoute.settings:
        return 'settings';
      case AppRoute.changePassword:
        return 'settings/changePassword';
      case AppRoute.home:
        return '/';
    }
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
