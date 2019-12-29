import 'package:equatable/equatable.dart';
import 'package:piczzie/model/user.dart';


abstract class HomeEvent extends Equatable {
  const HomeEvent();
}


class UpdateUser extends HomeEvent {
  final User user;

  const UpdateUser(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'UpdateTodos { todos: $user }';
}
