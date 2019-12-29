import 'package:http/http.dart' as http;
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/model/user.dart';
import 'package:piczzie/service/base_network/api_base_helper.dart';

class UserService {

  ApiBaseHelper _helper = locator<ApiBaseHelper>();

  Future<User> fetchUser(User user) async {
    final response =
        await _helper.get('/login');
    return User.fromJson(response);
  }
}
