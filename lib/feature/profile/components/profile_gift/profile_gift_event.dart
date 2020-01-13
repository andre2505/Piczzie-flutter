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
  final bool isLoadMore;

  const GetGiftProfileList(this.id, this.offset, this.isLoadMore);
  @override
  List<Object> get props => [id, offset, isLoadMore];

}

class StopLoadMoreListEvent extends ProfileGiftEvent{
  @override
  List<Object> get props => null;

}