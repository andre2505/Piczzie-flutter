import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:piczzie/feature/profile/profile_event.dart';
import 'package:piczzie/feature/profile/profile_state.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/service/user_service.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserService _userService = locator<UserService>();

  @override
  ProfileState get initialState => InitialProfileState();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is GetGiftList) {
      try {
        final gifts =
            await _userService.getListGift("5c616ee79a63451852a492b6");
        yield SuccessProfileState(gifts);
      } catch (e) {
        print("non");
        yield ErrorProfileState(e);
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
