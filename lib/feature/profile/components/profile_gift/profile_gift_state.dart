import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:piczzie/model/gift.dart';
import 'package:piczzie/model/user.dart';

@immutable
abstract class ProfileGiftState extends Equatable {
  const ProfileGiftState();
}

class InitialProfileGiftState extends ProfileGiftState {
  const InitialProfileGiftState();

  @override
  List<Object> get props => ['TodosLoading'];
}

class LoadingProfileGiftState extends ProfileGiftState {
  const LoadingProfileGiftState();

  @override
  List<Object> get props => ['TodosLoading'];
}

class SuccessProfileGiftState extends ProfileGiftState {
  final List<Gift> gifts;

  const SuccessProfileGiftState(this.gifts);

  @override
  List<Object> get props => [gifts];
}

class ErrorProfileGiftState extends ProfileGiftState {
  final String message;

  const ErrorProfileGiftState(this.message);

  @override
  List<Object> get props => [message];
}

class StopLoadMoreState extends ProfileGiftState {

  const StopLoadMoreState();

  @override
  List<Object> get props => null;
}
