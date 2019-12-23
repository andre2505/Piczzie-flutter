import 'package:get_it/get_it.dart';
import 'package:piczzie/feature/login/login_model.dart';
import 'package:piczzie/service/user_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton<UserService>(() => UserService());
  // Register models
  locator.registerFactory<LoginModel>(() => LoginModel());
}