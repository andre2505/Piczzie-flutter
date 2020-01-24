// A widget that displays the picture taken by the user.
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piczzie/ressources/color.dart';
import 'package:piczzie/ressources/icons/picons.dart';
import 'package:piczzie/service/base_network/navigation_service.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:torch/torch.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Stack(children: [
          Container(color: Colors.white),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.file(File(imagePath)),
              Container(
                padding: EdgeInsets.all(24),
                child: Column(children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      focusColor: Colors.grey,
                      prefixIcon: Icon(
                        Picons.plain_gift,
                        color: Colors.pink,
                      ),
                      hintText: "sdf",
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    ),
                  )
                ]),
              )
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    locator<NavigationService>().pop();
                  },
                ),
              ]),
          Align(
              alignment: FractionalOffset.bottomCenter,
              child: Card(
                  elevation: 10,
                  margin: EdgeInsets.all(0),
                  child: Container(
                    height: 70,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    child: RaisedButton(
                      elevation: 0,
                      highlightElevation: 0,
                      highlightColor: Colors.yellowAccent,
                      color: CustomColors.greenCustom,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(40.0),
                      ),
                      onPressed: () {},
                    ),
                  )) //Your widget here,
              ),
        ])));
  }
}
