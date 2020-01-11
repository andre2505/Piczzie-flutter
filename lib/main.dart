import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:piczzie/feature/home/home_view.dart';
import 'package:piczzie/feature/login/login_view.dart';
import 'package:piczzie/feature/profile/profile_screen.dart';
import 'package:piczzie/l10n//localization/localization.dart';
import 'package:piczzie/ressources/color.dart';
import 'package:piczzie/service/base_network/base_repository.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/service/base_network/navigation_service.dart';
import 'configuration/app_config.dart';


class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    locator.registerLazySingleton<BaseRepository>(() => BaseRepository(context));
    return MaterialApp(
      title: AppConfig.of(context).appTitle,
      theme: ThemeData(
        // is not restarted.
        primarySwatch: CustomColors.greenCustom,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizationsDelegate(),
      ],
      supportedLocales: [
        const Locale('fr', ''),
        const Locale('en', ''),
        const Locale('messages', '')
      ],
      navigatorKey: locator<NavigationService>().navigatorKey,
      home: HomeView(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        "/login": (BuildContext context) => LoginView(),
        "/homeView": (BuildContext context) => HomeView(),
        "/profile" : (BuildContext context) => ProfileScreen()
      },
    );
  }
}
