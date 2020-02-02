import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:piczzie/feature/camera/camera_screen.dart';
import 'package:piczzie/feature/home/home_view.dart';
import 'package:piczzie/feature/login/login_view.dart';
import 'package:piczzie/feature/main/main_bloc.dart';
import 'package:piczzie/feature/profile/profile_screen.dart';
import 'package:piczzie/feature/tab_view/tab_view.dart';
import 'package:piczzie/l10n/localization/localization.dart';
import 'package:piczzie/ressources/color.dart';
import 'package:piczzie/service/base_network/base_repository.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/service/base_network/navigation_service.dart';
import 'configuration/app_config.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    locator
        .registerLazySingleton<BaseRepository>(() => BaseRepository(context));
    return BlocProvider(
        create: (context) {
          return MainBloc(context);
        },
        child: MaterialApp(
          title: AppConfig.of(context).appTitle,
          theme: ThemeData(
              primaryIconTheme: IconThemeData(color: Colors.white),
              // is not restarted.
              primarySwatch: CustomColors.greenCustom,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent),
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('fr', ''),
            const Locale('en', ''),
            const Locale('messages', '')
          ],
          navigatorKey: locator<NavigationService>().navigatorKey,
          home: TabView(),
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            "/login": (BuildContext context) => LoginView(),
            "/homeView": (BuildContext context) => HomeView(),
            "/profile": (BuildContext context) => ProfileScreen(),
            "/camera": (BuildContext context) => CameraScreen()
          },
        ));
  }
}
