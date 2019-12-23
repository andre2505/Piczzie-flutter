import 'package:flutter/material.dart';
import 'package:piczzie/ressources/color.dart';

class LoginViewAndroid extends StatefulWidget {
  LoginViewAndroid({Key key, this.title}) : super(key: key);

  String title;

  @override
  _loginViewAndroidState createState() => _loginViewAndroidState();
}

class _loginViewAndroidState extends State<LoginViewAndroid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sample Code'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Wrap(
                runSpacing: 20,
                spacing: 20,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: "mail",
                      prefixIcon: new Icon(Icons.mail_outline),
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                  ),
                  TextField(
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      prefixIcon: new Icon(Icons.lock_outline),
                      hintText: "password",
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: 300,
                height: 50,
                child: RaisedButton(
                  child: Text("Connexion", style: TextStyle(fontSize: 20)),
                  color: CustomColors.greenCustom,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0),
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  highlightElevation: 0,
                  elevation: 0,
                  onPressed: () {

                  },
                ),
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    child: Text("Mot de passe oublié",
                        style: TextStyle(color: Colors.black)),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                  ),
                  Spacer(),
                  FlatButton(
                    child: Text("Inscription",
                        style: TextStyle(color: Colors.black)),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
