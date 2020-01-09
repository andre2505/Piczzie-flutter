import 'package:get_it/get_it.dart';
import 'package:piczzie/feature/main/main_event.dart';
import 'package:piczzie/service/base_network/base_repository.dart';
import 'package:piczzie/service/base_network/navigation_service.dart';
import 'package:piczzie/service/repository/gift_repository.dart';
import 'package:piczzie/service/repository/user_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton<BaseRepository>(() => BaseRepository());
  locator.registerLazySingleton<UserService>(() => UserService());
  locator.registerLazySingleton<GiftRepository>(() => GiftRepository());
  locator.registerLazySingleton(() => NavigationService());
}
