import 'package:get_it/get_it.dart';
import 'package:laserminipod_server/src/data/handle_repository.dart';
import 'package:laserminipod_server/src/data/route_repository.dart';
import 'package:laserminipod_server/src/data/user_repository.dart';
import 'package:laserminipod_server/src/domain/handle_service.dart';
import 'package:laserminipod_server/src/domain/route_service.dart';
import 'package:laserminipod_server/src/domain/spraywall_service.dart';
import 'package:laserminipod_server/src/domain/user_service.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<HandleRepository>(() => HandleRepository());
  getIt.registerLazySingleton<HandleService>(
      () => HandleService(getIt<HandleRepository>()));
  getIt.registerLazySingleton<RouteRepository>(() => RouteRepository());
  getIt.registerLazySingleton<RouteService>(
      () => RouteService(getIt<RouteRepository>()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepository());
  getIt.registerLazySingleton<UserService>(
      () => UserService(getIt<UserRepository>()));
  getIt.registerLazySingleton<SpraywallService>(() => SpraywallService());
}
