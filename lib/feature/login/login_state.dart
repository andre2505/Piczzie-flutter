import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:piczzie/model/user.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  const InitialLoginState();

  @override
  List<Object> get props => ['TodosLoading'];
}

class LoadingLoginState extends LoginState {
  const LoadingLoginState();

  @override
  List<Object> get props => ['TodosLoading'];
}

class LoadedLoginState extends LoginState {
  final User user;

  const LoadedLoginState(this.user);

  @override
  List<Object> get props => [user];
}

class ErrorLoginState extends LoginState {
  final String message;
  const ErrorLoginState(this.message);

  @override
  List<Object> get props => [message];

}
