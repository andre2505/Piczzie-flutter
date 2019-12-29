import 'package:get_it/get_it.dart';
import 'package:piczzie/feature/main/main_event.dart';
import 'package:piczzie/service/base_network/api_base_helper.dart';
import 'package:piczzie/service/base_network/navigation_service.dart';
import 'package:piczzie/service/user_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton<UserService>(() => UserService());
  locator.registerLazySingleton<ApiBaseHelper>(() => ApiBaseHelper());
  locator.registerLazySingleton(() => NavigationService());
}