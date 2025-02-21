import 'package:go_router/go_router.dart';
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
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
            path: AppRoute.handleManagementEdit.subPath,
            builder: (context, state) => HandleManagementEditPage()),
        GoRoute(
            path: AppRoute.handleManagementOverview.subPath,
            builder: (context, state) => HandleManagementOverviewPage()),
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
        GoRoute(
            path: AppRoute.changePassword.subPath,
            builder: (context, state) => ChangePasswordPage()),
      ],
    ),
  ],
);

enum AppRoute {
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
        return 'changePassword';
      default:
        return '/';
    }
  }

  String get fullPath => '/$subPath';
}
