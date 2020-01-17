import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:piczzie/feature/profile/profile_event.dart';
import 'package:piczzie/feature/profile/profile_state.dart';
import 'package:piczzie/model/child.dart';
import 'package:piczzie/model/gift.dart';
import 'package:piczzie/model/user.dart';
import 'package:piczzie/service/repository/user_service.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/service/user_session.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserService _userRepository = locator<UserService>();

  @override
  ProfileState get initialState => InitialProfileState();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is GetUserInformationEvent) {
      yield* _mapLoadProfileUserInformationState(event);
    }
  }

  Stream<ProfileState> _mapLoadProfileUserInformationState(
      GetUserInformationEvent event) async* {
    try {
      User user;
      List<dynamic> gifts;
      List<dynamic> child;
      List<Gift> giftsList;
      List<Child> childList;

      List<Response> response;
      await UserSession.getUserId().then((value) async {
        response = await _userRepository.getAllInformationsUser(value, 0);

        gifts = response[0].data as List;
        giftsList = gifts.map((i) => Gift.fromJson(i)).toList();

        child = response[1].data as List;
        childList = child.map((i) => Child.fromJson(i)).toList();

        user = User.fromJson(response[2].data);
      });
      yield SuccessUserProfileInformationtState(giftsList, childList, user);
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
