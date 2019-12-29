import 'package:equatable/equatable.dart';
import 'package:piczzie/model/user.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class GetUser extends LoginEvent {
  final User user;

  const GetUser(this.user);

  @override
  List<Object> get props => [user];
}

class getDetailUser extends LoginEvent {
  @override
  List<Object> get props => null;

}
