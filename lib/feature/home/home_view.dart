import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  String title;

  @override
  _homeViewState createState() => _homeViewState();
}

class _homeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
          body: Container(
            child: CupertinoTextField(),
          ),
    );
  }
}
