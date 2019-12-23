import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piczzie/feature/base_view.dart';
import 'package:piczzie/ressources/color.dart';
import 'package:piczzie/feature/login/login_model.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  String title;

  @override
  _homeViewState createState() => _homeViewState();
}

class _homeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        builder: (context, child, model) => CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: Colors.white,
          ),
          child: Container(
            child: CupertinoTextField(),
          ),
        ));
  }
}
