import 'package:equatable/equatable.dart';
import 'package:piczzie/model/gift.dart';
import 'package:piczzie/model/user.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class DisconnectUser extends MainEvent {
  const DisconnectUser();

  @override
  List<Object> get props => [];
}

class AddGiftEvent extends MainEvent {
  final Gift gift;
  final String filename;

  const AddGiftEvent(this.gift, this.filename);

  @override
  List<Object> get props => [gift, filename];
}
