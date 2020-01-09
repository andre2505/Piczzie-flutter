import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:piczzie/feature/profile/components/profile_gift/profile_gift_state.dart';
import 'package:piczzie/feature/profile/components/profile_gift/profile_gift_event.dart';
import 'package:piczzie/service/repository/gift_repository.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/service/repository/user_service.dart';

class ProfileGiftBloc extends Bloc<ProfileGiftEvent, ProfileGiftState> {
  GiftRepository _giftRepository = locator<GiftRepository>();

  @override
  ProfileGiftState get initialState => InitialProfileGiftState();

  @override
  Stream<ProfileGiftState> mapEventToState(ProfileGiftEvent event) async* {
    if (event is GetGiftProfileList) {
      yield* _mapLoadProfileGiftState(event);
    }
  }

  Stream<ProfileGiftState> _mapLoadProfileGiftState(GetGiftProfileList event) async* {
    yield LoadingProfileGiftState();
    try {
      final gifts = await _giftRepository.getListGift(event.id, event.offset);
      yield SuccessProfileGiftState(gifts);
    } catch (e) {
      print(e);
      yield ErrorProfileGiftState(e);
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
