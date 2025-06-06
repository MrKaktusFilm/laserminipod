import 'package:feedback/feedback.dart' as feedback;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:user_app/data/database/server_connection_model.dart';
import 'package:user_app/data/database/server_connection_model_abstract.dart';
import 'package:user_app/data/network/abstract/handle_model_abstract.dart';
import 'package:user_app/data/network/abstract/route_model_abstract.dart';
import 'package:user_app/data/network/abstract/spraywall_model_abstract.dart';
import 'package:user_app/data/network/abstract/user_model_abstract.dart';
import 'package:user_app/data/network/handle_model.dart';
import 'package:user_app/data/network/route_model.dart';
import 'package:user_app/data/network/spraywall_model.dart';
import 'package:user_app/data/network/user_model.dart';
import 'package:user_app/domain/abstract/client_controller_abstract.dart';
import 'package:user_app/domain/abstract/feedback_controller_abstract.dart';
import 'package:user_app/domain/abstract/filter_controller_abstract.dart';
import 'package:user_app/domain/abstract/server_connection_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/domain/abstract/image_controller_abstract.dart';
import 'package:user_app/domain/abstract/language_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/abstract/spraywall_controller_abstract.dart';
import 'package:user_app/domain/client_controller.dart';
import 'package:user_app/domain/feedback/costum_feedback_localizations_delegate.dart';
import 'package:user_app/domain/filter_controller.dart';
import 'package:user_app/domain/server_connection_controller.dart';
import 'package:user_app/domain/user_controller.dart';
import 'package:user_app/domain/handle_controller.dart';
import 'package:user_app/domain/image_controller.dart';
import 'package:user_app/domain/language_controller.dart';
import 'package:user_app/domain/navigation_controller.dart';
import 'package:user_app/domain/route_contoller.dart';
import 'package:user_app/domain/spraywall_controller.dart';
import 'package:user_app/generated/i18n/app_localizations.dart';
import 'package:user_app/routes.dart';

import 'domain/feedback/feedback_controller.dart';

// global variables
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  // data models
  HandleModelAbstract handleModel = HandleModel();
  RouteModelAbstract routeModel = RouteModel();
  UserModelAbstract userModel = UserModel();
  SpraywallModelAbstract spraywallModel = SpraywallModel();
  ServerConnectionModelAbstract serverConnectionModel = ServerConnectionModel();
  await serverConnectionModel.initialize();

  // controller
  NavigationControllerAbstract navigationController = NavigationController();
  SprayWallControllerAbstract spraywallController = SpraywallController(
      handleModel: handleModel,
      routeModel: routeModel,
      spraywallModel: spraywallModel);
  UserControllerAbstract userController = UserController(
      navigationController: navigationController, userModel: userModel);
  ImageControllerAbstract imageController = ImageController();
  ClientControllerAbstract clientController = ClientController(
      handleModel: handleModel,
      routeModel: routeModel,
      userModel: userModel,
      spraywallModel: spraywallModel,
      userController: userController,
      imageController: imageController);
  FilterControllerAbstract filterController =
      FilterController(routeModel, userController);
  RouteControllerAbstract routeController = RouteController(
      routeModel: routeModel,
      spraywallController: spraywallController,
      userController: userController,
      navigationController: navigationController,
      filterController: filterController);
  HandleControllerAbstract handleController = HandleController(
      handleModel: handleModel,
      navigationController: navigationController,
      imageController: imageController);
  LanguageControllerAbstract languageController = LanguageController();
  languageController.initLanguage();
  FeedbackControllerAbstract feedbackController = FeedbackController();
  ServerConnectionControllerAbstract serverConnectionController =
      ServerConnectionController(serverConnectionModel: serverConnectionModel);

  final GoRouter router =
      await getGoRouter(serverConnectionController, clientController);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ClientControllerAbstract>(
            create: (_) => clientController),
        ChangeNotifierProvider<NavigationControllerAbstract>(
            create: (_) => navigationController),
        ChangeNotifierProvider<SprayWallControllerAbstract>(
            create: (_) => spraywallController),
        ChangeNotifierProvider<UserControllerAbstract>(
            create: (_) => userController),
        ChangeNotifierProvider<HandleControllerAbstract>(
            create: (_) => handleController),
        ChangeNotifierProvider<ImageControllerAbstract>(
            create: (_) => imageController),
        ChangeNotifierProvider<RouteControllerAbstract>(
            create: (_) => routeController),
        ChangeNotifierProvider<LanguageControllerAbstract>(
            create: (_) => languageController),
        ChangeNotifierProvider<FilterControllerAbstract>(
            create: (_) => filterController),
        ChangeNotifierProvider<FeedbackControllerAbstract>(
            create: (_) => feedbackController),
        ChangeNotifierProvider<ServerConnectionControllerAbstract>(
            create: (_) => serverConnectionController),
      ],
      child: feedback.BetterFeedback(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          CostumFeedbackLocalizationsDelegate(),
        ],
        localeOverride: Locale('en'),
        child: MyApp(router: router),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter _router;
  const MyApp({super.key, required router}) : _router = router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageControllerAbstract>(
      builder: (context, languageController, child) {
        return MaterialApp.router(
          routerConfig: _router,
          key: ValueKey(languageController.currentLanguage.languageCode),
          scaffoldMessengerKey: scaffoldMessengerKey,
          title: 'Flutter Demo',
          locale: languageController.currentLanguage,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
