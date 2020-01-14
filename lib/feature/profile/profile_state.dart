import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:piczzie/model/user.dart';


@immutable
abstract class ProfileState extends Equatable {
  const ProfileState();
}

class InitialProfileState extends ProfileState {
  const InitialProfileState();

  @override
  List<Object> get props => ['TodosLoading'];
}

class SuccessUserProfileInformationtState extends ProfileState {
  final User user;

  const SuccessUserProfileInformationtState(this.user);

  @override
  List<Object> get props => [user];
}


