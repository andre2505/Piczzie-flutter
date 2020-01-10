import 'dart:async';
import 'package:piczzie/feature/login/login_event.dart';
import 'package:piczzie/feature/login/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/model/user.dart';
import 'package:piczzie/service/repository/user_service.dart';
import 'package:piczzie/service/user_session.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserService _userService = locator<UserService>();

  /*final MainBloc mainBloc;
  StreamSubscription _loginSubscription;

  LoginBloc({@required this.mainBloc}) {
    _loginSubscription = mainBloc.listen((state) {
      if (mainBloc.state is LoadedHomeState) {
        add(GetUser((mainBloc as InitialMainState).user));
      }
    });
  }*/

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    yield LoadingLoginState();

    if (event is GetUser) {
      try {
        final user = await _userService.fetchUser(event.user);
        print(user.token);
        print(user.refreshToken);
        UserSession.setTokenPreference(user.token);
        UserSession.setRefreshTokenPreference(user.refreshToken);
        yield SuccessLoginState(user);
      } catch (e) {
        print(e);
        yield ErrorLoginState(e);
      }
    }
  }

  @override
  Future<void> close() {
    // _loginSubscription.cancel();
    return super.close();
  }
}
