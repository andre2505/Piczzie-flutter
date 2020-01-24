import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  Future<dynamic> pushTo(String routeName) {
    return navigatorKey.currentState
        .pushNamed(routeName);
  }

  Future<dynamic> pop() async {
    return await navigatorKey.currentState.pop(true);
  }
}
