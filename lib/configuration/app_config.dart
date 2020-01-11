import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  final String appTitle;
  final String buildFlavor;
  final String endpoint;
  final Widget child;

  AppConfig(
      {@required this.appTitle,
      @required this.buildFlavor,
      @required this.child,
      @required this.endpoint});

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
