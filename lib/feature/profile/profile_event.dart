import 'package:equatable/equatable.dart';
import 'package:piczzie/model/gift.dart';
import 'package:piczzie/model/user.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetGift extends ProfileEvent {
  final Gift gift;

  const GetGift(this.gift);

  @override
  List<Object> get props => [gift];
}

class GetGiftList extends ProfileEvent {
  final String id;
  final int offset;

  const GetGiftList(this.id, this.offset);
  @override
  List<Object> get props => [id, offset];

}