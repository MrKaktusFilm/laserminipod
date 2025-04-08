import 'package:get_it/get_it.dart';
import 'package:laserminipod_server/src/data/handle_repository.dart';
import 'package:laserminipod_server/src/data/route_handle_state_repository.dart';
import 'package:laserminipod_server/src/data/route_likes_repository.dart';
import 'package:laserminipod_server/src/data/route_repository.dart';
import 'package:laserminipod_server/src/data/route_user_projects_repository.dart';
import 'package:laserminipod_server/src/data/route_user_sents_repository.dart';
import 'package:laserminipod_server/src/data/spraywall_name_repository.dart';
import 'package:laserminipod_server/src/data/user_repository.dart';
import 'package:laserminipod_server/src/domain/cpp_service.dart';
import 'package:laserminipod_server/src/domain/handle_service.dart';
import 'package:laserminipod_server/src/domain/route_service.dart';
import 'package:laserminipod_server/src/domain/spraywall_name_service.dart';
import 'package:laserminipod_server/src/domain/spraywall_service.dart';
import 'package:laserminipod_server/src/domain/user_service.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<HandleRepository>(() => HandleRepository());
  getIt.registerLazySingleton<RouteRepository>(() => RouteRepository());
  getIt.registerLazySingleton<RouteHandleStateRepository>(
      () => RouteHandleStateRepository());
  getIt.registerLazySingleton<RouteUserProjectsRepository>(
      () => RouteUserProjectsRepository());
  getIt.registerLazySingleton<RouteUserSentsRepository>(
      () => RouteUserSentsRepository());
  getIt.registerLazySingleton<RouteLikesRepository>(
      () => RouteLikesRepository());
  getIt.registerLazySingleton<SpraywallNameRepository>(
      () => SpraywallNameRepository());

  getIt.registerLazySingleton<HandleService>(() => HandleService(
      getIt<HandleRepository>(), getIt<RouteHandleStateRepository>()));
  getIt.registerLazySingleton<RouteService>(() => RouteService(
        getIt<RouteRepository>(),
        getIt<RouteHandleStateRepository>(),
        getIt<RouteUserProjectsRepository>(),
        getIt<RouteUserSentsRepository>(),
        getIt<RouteLikesRepository>(),
      ));
  getIt.registerLazySingleton<UserRepository>(() => UserRepository());
  getIt.registerLazySingleton<UserService>(
      () => UserService(getIt<UserRepository>()));
  getIt.registerLazySingleton<CppService>(() => CppService());
  getIt.registerLazySingleton<SpraywallService>(
      () => SpraywallService(getIt<CppService>()));
  getIt.registerLazySingleton<SpraywallNameService>(() => SpraywallNameService(
      spraywallNameRepository: getIt<SpraywallNameRepository>()));
}
