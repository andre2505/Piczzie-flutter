import 'package:equatable/equatable.dart';
import 'package:piczzie/model/user.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class DisconnectUser extends MainEvent {

  const DisconnectUser();

  @override
  List<Object> get props => [];
}