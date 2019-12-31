import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piczzie/components/dialogs.dart';
import 'package:piczzie/feature/login/login_bloc.dart';
import 'package:piczzie/feature/login/login_event.dart';
import 'package:piczzie/feature/login/login_state.dart';
import 'package:piczzie/localization/localization.dart';
import 'package:piczzie/model/user.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key, this.title}) : super(key: key);

  String title;

  @override
  _loginViewState createState() => _loginViewState();
}

class _loginViewState extends State<LoginView> {
  User user = User();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.deepPurple,
        child: SafeArea(
          bottom: false,
          child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/6443.jpg"),
                fit: BoxFit.cover,
              ))),
        ),
      ),
      Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(''),
            elevation: 0.0,
            brightness: Brightness.dark,
            backgroundColor: Colors.transparent,
          ),
          body: BlocProvider(
              builder: (context) => LoginBloc(),
              child:
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                return Container(
                    padding: EdgeInsets.all(20),
                    child: Card(
                        elevation: 10,
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Wrap(
                                  runSpacing: 20,
                                  children: <Widget>[
                                    TextField(
                                      obscureText: false,
                                      decoration: InputDecoration(
                                          prefixIcon:
                                              Icon(Icons.account_circle),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 15.0, 20.0, 15.0),
                                          hintText: AppLocalizations.of(context)
                                              .email(),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0))),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.lock),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 15.0, 20.0, 15.0),
                                          hintText: AppLocalizations.of(context)
                                              .email(),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0))),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                            height: 50,
                                            width: 200,
                                            child: RaisedButton(
                                              child: Text(
                                                  AppLocalizations.of(context)
                                                      .login(),
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              color: Colors.pinkAccent,
                                              textColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        40.0),
                                              ),
                                              highlightColor: Colors.blue,
                                              highlightElevation: 0,
                                              elevation: 0,
                                              onPressed: () {
                                                user = User(
                                                    email: "toto@gmail.com",
                                                    password: "toto");
                                                BlocProvider.of<LoginBloc>(
                                                        context)
                                                    .add(GetUser(user));
                                              },
                                            )),
                                        SizedBox(
                                            child: FlatButton(
                                          child: Text(
                                              AppLocalizations.of(context)
                                                  .register(),
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 20)),
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.blueGrey[100],
                                          onPressed: () {
                                           Dialogs.showProgressDialog(context, "test");
                                          },
                                        )),
                                        FlatButton(
                                          child: Text(
                                              AppLocalizations.of(context)
                                                  .forgottenPassword(),
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.grey,
                                          onPressed: () {},
                                        )
                                      ]),
                                ),
                              ],
                            ))));
              })))
    ]);
  }
}
