import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:piczzie/feature/home/home_event.dart';
import 'package:piczzie/feature/home/home_state.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/service/user_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  UserService _userService = locator<UserService>();

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is UpdateUser) {
      try {
        final user = await _userService.fetchUser((event.user));
        yield LoadedHomeState(user);
      } catch(e) {
        yield ErrorHomeState("error");
      }
    }
  }
}
