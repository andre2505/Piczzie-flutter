import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:piczzie/feature/profile/profile_event.dart';
import 'package:piczzie/feature/profile/profile_state.dart';
import 'package:piczzie/model/user.dart';
import 'package:piczzie/service/user_session.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
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
      final User user = User();
      user.id = await UserSession.getUserId();
      user.photo = await UserSession.getUserPhoto();
      yield SuccessUserProfileInformationtState(user);
    } catch (error) {

    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
