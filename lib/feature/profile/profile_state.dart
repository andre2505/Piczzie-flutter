import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:piczzie/model/child.dart';
import 'package:piczzie/model/gift.dart';
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
  final List<Gift> gifts;
  final List<Child> child;
  final User user;

  const SuccessUserProfileInformationtState(this.gifts, this.child, this.user);

  @override
  List<Object> get props => [gifts, child, user];
}
