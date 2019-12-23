import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piczzie/feature/login//ios/login_view.dart';
import 'package:piczzie/feature/login/android/login_view_android.dart';
import 'package:piczzie/ressources/color.dart';
import 'package:piczzie/model//service_locator.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
            title: 'Picczie',
            theme: ThemeData(
              // is not restarted.
              primarySwatch: CustomColors.greenCustom,
            ),
            home: LoginViewAndroid(title: 'Flutter Demo Home Page'),
          );
  }
}

