import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piczzie/configuration/app_config.dart';
import 'package:piczzie/model/user.dart';
import 'package:piczzie/service/user_session.dart';

class ProfileInformations extends StatefulWidget {
  ProfileInformations({Key key, this.user}) : super(key: key);

  User user;

  @override
  _profileInformationsState createState() => _profileInformationsState();
}

class _profileInformationsState extends State<ProfileInformations> {
  String _userPhoto;

  @override
  void initState() {
    super.initState();
    _userPhoto = widget.user.photo;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.vertical, children: [
      Container(
          padding: EdgeInsets.only(bottom: 10),
          width: double.infinity,
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            AppConfig.of(context).endpoint + "/$_userPhoto"))),
              ),
              Text("sfdsf"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.cake, color: Colors.grey),
                  SizedBox(width: 10),
                  Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text("sdfsfsf sfsfdsfs",
                          textAlign: TextAlign.justify))
                ],
              ),
              Visibility(
                  visible: false,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                            child: Text("accepter"),
                            color: Colors.red,
                            elevation: 0,
                            highlightElevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.pink, width: 10),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            onPressed: () {}),
                        VerticalDivider(),
                        RaisedButton(
                          child: Text("refuser",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          elevation: 0,
                          textColor: Colors.white,
                          color: Colors.red[700],
                          highlightElevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          onPressed: () {},
                        )
                      ]))
            ],
          ))
    ]);
  }

  _getUserPhoto() async {
    _userPhoto = await UserSession.getUserPhoto();
  }
}
