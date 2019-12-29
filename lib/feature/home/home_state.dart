import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:piczzie/model/user.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class InitialHomeState extends HomeState {
  const InitialHomeState();

  @override
  List<Object> get props => ['TodosLoading'];
}

class LoadingHomeState extends HomeState {
  const LoadingHomeState();

  @override
  List<Object> get props => ['TodosLoading'];
}

class LoadedHomeState extends HomeState {
  final User user;

  const LoadedHomeState(this.user);

  @override
  List<Object> get props => [user];
}

class ErrorHomeState extends HomeState {
  final String message;
  const ErrorHomeState(this.message);

  @override
  List<Object> get props => [message];

}
