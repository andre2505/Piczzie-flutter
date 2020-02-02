import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:piczzie/model/user.dart';

@immutable
abstract class MainState extends Equatable {
  const MainState();
}

class InitialMainState extends MainState {
  const InitialMainState();

  @override
  List<Object> get props => ['Nothing'];
}

class SuccessAddGiftState extends MainState {
  const SuccessAddGiftState();

  @override
  List<Object> get props => [];
}

class ErrorAddGiftState extends MainState {
  const ErrorAddGiftState();

  @override
  List<Object> get props => [];
}
