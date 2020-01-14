import 'package:equatable/equatable.dart';
import 'package:piczzie/model/gift.dart';
import 'package:piczzie/model/user.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetUserInformationEvent extends ProfileEvent {
  const GetUserInformationEvent();

  @override
  List<Object> get props => null;
}
