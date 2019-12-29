import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piczzie/feature/home/home_view.dart';
import 'package:piczzie/feature/main/main_event.dart';
import 'package:piczzie/feature/main/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  final BuildContext context;
  static BuildContext contextApp;

  MainBloc(this.context) {
     contextApp = context;
  }

  @override
  MainState get initialState => InitialMainState();


  @override
  Stream<MainState> mapEventToState(MainEvent event) {
    return null;
  }

  @override
  Future<void> close() {
    // _loginSubscription.cancel();
    return super.close( );
  }
}