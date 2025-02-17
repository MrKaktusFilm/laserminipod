import 'package:get_it/get_it.dart';
import 'package:laserminipod_server/src/data/handle_repository.dart';
import 'package:laserminipod_server/src/domain/handle_service.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<HandleRepository>(() => HandleRepository());
  getIt.registerLazySingleton<HandleService>(
      () => HandleService(getIt<HandleRepository>()));
}
