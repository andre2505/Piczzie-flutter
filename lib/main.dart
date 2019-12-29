import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:piczzie/feature/home/home_view.dart';
import 'package:piczzie/feature/login/login_view.dart';
import 'package:piczzie/feature/main/main_bloc.dart';
import 'package:piczzie/localization/localization.dart';
import 'package:piczzie/ressources/color.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/service/base_network/navigation_service.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  setupLocator();
  runApp(
    BlocProvider(
      create: (context) {
        return MainBloc(context);
      },
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picczie',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: CustomColors.greenCustom,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const AppLocalizationsDelegate(),
      ],
      supportedLocales: [
        const Locale('fr', ''),
        const Locale('messages', '')
      ],
      navigatorKey: locator<NavigationService>().navigatorKey,
      home: LoginView(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        "/homeView": (BuildContext context) => HomeView(),
      },
    );
  }
}
