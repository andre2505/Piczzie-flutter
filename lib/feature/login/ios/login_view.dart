import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piczzie/feature/base_view.dart';
import 'package:piczzie/feature/home/home_view.dart';
import 'package:piczzie/ressources/color.dart';
import 'package:piczzie/feature/login/login_model.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key, this.title}) : super(key: key);

  String title;

  @override
  _loginViewState createState() => _loginViewState();
}

class _loginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        builder: (context, child, model) => CupertinoPageScaffold(
              backgroundColor: Colors.white,
              child: Container(
                margin: EdgeInsets.only(top: 200),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Wrap(
                      runSpacing: 20,
                      spacing: 20,
                      children: <Widget>[
                        CupertinoTextField(
                          style: TextStyle(fontSize: 20),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.grey),
                            ),
                          ),
                          prefix: Padding(
                            padding: const EdgeInsets.only(right: 2, left: 8),
                            child: Icon(
                              Icons.mail_outline,
                              size: 25,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        CupertinoTextField(
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1.0),
                            ),
                          ),
                          prefix: Padding(
                            padding: const EdgeInsets.only(right: 2, left: 8),
                            child: Icon(
                              Icons.lock_outline,
                              size: 25,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 30),
                      width: 300,
                      height: 50,
                      child: CupertinoButton(
                        child: Text("Connexion",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: CustomColors.greenCustom,
                        onPressed: () {
                          /*Navigator.of(context)
                              .push(CupertinoPageRoute(builder: (context) {
                            return HomeView();
                          }));*/
                          model.main();
                        },
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        CupertinoButton(
                          child: Text("Mot de passe oublié",
                              style: TextStyle(color: Colors.black)),
                          onPressed: () {},
                        ),
                        Spacer(),
                        CupertinoButton(
                          child: Text("Inscription",
                              style: TextStyle(color: Colors.black)),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
