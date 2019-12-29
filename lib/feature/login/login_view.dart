import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piczzie/feature/login/login_bloc.dart';
import 'package:piczzie/feature/login/login_event.dart';
import 'package:piczzie/feature/login/login_state.dart';
import 'package:piczzie/localization/localization.dart';
import 'package:piczzie/model/user.dart';
import 'package:piczzie/ressources/color.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key, this.title}) : super(key: key);

  String title;

  @override
  _loginViewState createState() => _loginViewState();
}


class _loginViewState extends State<LoginView> {


  @override
  void initState() {
    super.initState();
  }
  final loginBloc = LoginBloc();
  User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: BlocProvider(
            builder: (context) => LoginBloc(),
            child:
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              if (state is InitialLoginState) {
                return Container(
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
                                hintText: AppLocalizations.of(context).password(),
                                prefixIcon: Icon(Icons.mail_outline),
                                hintStyle: TextStyle(
                                    fontSize: 20, color: Colors.grey)),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText: "sdf",
                                prefixIcon: Icon(Icons.mail_outline),
                                hintStyle: TextStyle(
                                    fontSize: 20, color: Colors.grey)),
                          )
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 300,
                          height: 50,
                          child: RaisedButton(
                            child: Text("Connexion",
                                style: TextStyle(fontSize: 20)),
                            color: CustomColors.greenCustom,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                            highlightColor: Colors.blue,
                            highlightElevation: 0,
                            elevation: 0,
                            onPressed: () {
                              user = User(
                                  email: "toto@gmail.com", password: "toto");
                              BlocProvider.of<LoginBloc>(context)
                                  .add(GetUser(user));
                            },
                          )),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            child: Text("df",
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
                          )
                        ],
                      )
                    ],
                  ),
                );
              } else if (state is LoadingLoginState) {
                return null;
              } else if (state is LoadedLoginState) {
                return null;
              } else {
                return null;
              }
            })));
  }
}
