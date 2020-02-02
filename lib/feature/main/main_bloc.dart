import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piczzie/feature/main/main_event.dart';
import 'package:piczzie/feature/main/main_state.dart';
import 'package:piczzie/service/base_network/base_repository.dart';
import 'package:piczzie/service/repository/gift_repository.dart';
import 'package:piczzie/service/service_locator.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final BuildContext context;
  static BuildContext contextApp;
  GiftRepository _giftRepository = locator<GiftRepository>();

  MainBloc(this.context) {
    contextApp = context;
  }

  @override
  MainState get initialState => InitialMainState();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is AddGiftEvent) {
      yield* _mapLoadProfileUserInformationState(event);
    }
  }

  Stream<MainState> _mapLoadProfileUserInformationState(
      AddGiftEvent event) async* {
    try {
     await _giftRepository.addGift(event.gift, event.filename);

    } catch (error) {
      print(error);
    }
  }

  @override
  Future<void> close() {
    // _loginSubscription.cancel();
    return super.close();
  }
}
