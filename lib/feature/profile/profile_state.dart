import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
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

class LoadingProfileState extends ProfileState {
  const LoadingProfileState();

  @override
  List<Object> get props => ['TodosLoading'];
}

class SuccessProfileState extends ProfileState {
  final List<Gift> gifts;

  const SuccessProfileState(this.gifts);

  @override
  List<Object> get props => [gifts];
}

class ErrorProfileState extends ProfileState {
  final String message;

  const ErrorProfileState(this.message);

  @override
  List<Object> get props => [message];
}
