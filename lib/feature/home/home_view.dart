import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piczzie/feature/camera/camera_screen.dart';
import 'package:piczzie/feature/login/login_view.dart';
import 'package:piczzie/feature/profile/profile_screen.dart';
import 'package:piczzie/ressources/color.dart';

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
      title: const Text('Piczzie', style: TextStyle(color: Colors.white)),
      elevation: 0.0,
      brightness: Brightness.dark,
      backgroundColor: CustomColors.greenCustom,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.photo_camera),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CameraScreen()));
          },
        )
      ],
    ));
  }
}
