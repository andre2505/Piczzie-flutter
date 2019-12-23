import 'dart:collection';

import 'package:piczzie/enum/view_model_state.dart';
import 'package:piczzie/model/user.dart';
import 'package:piczzie/service/result_service.dart';
import 'package:piczzie/service/user_service.dart';
import 'package:piczzie/model/service_locator.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginModel extends Model {
  UserService _userService = locator<UserService>();

  ViewModelState _state;

  ViewModelState get state => _state;

  main() {

    var user = User();
    user.email = "toto@gmail.com";
    user.password = "toto";

    _userService.getUser(user).then((value) {
        if(value is SuccessState){
          User user = value.value;
          print(user.token);
        }
        if(value is ErrorState){
          print(value.msg);
        }
    });
  }

  void setState(ViewModelState state) {
    _state = state;
    notifyListeners();
  }
}
