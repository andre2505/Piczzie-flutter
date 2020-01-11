import 'package:equatable/equatable.dart';
import 'package:piczzie/model/gift.dart';
import 'package:piczzie/model/user.dart';

abstract class ProfileGiftEvent extends Equatable {
  const ProfileGiftEvent();
}

class GetGift extends ProfileGiftEvent {
  final Gift gift;

  const GetGift(this.gift);

  @override
  List<Object> get props => [gift];
}

class GetGiftProfileList extends ProfileGiftEvent {
  final String id;
  final int offset;

  const GetGiftProfileList(this.id, this.offset);
  @override
  List<Object> get props => [id, offset];

}

class StopLoadMoreListEvent extends ProfileGiftEvent{
  @override
  List<Object> get props => null;

}