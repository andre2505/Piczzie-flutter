import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:piczzie/model/gift.dart';
import 'package:piczzie/service/base_network/base_repository.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/model/user.dart';

class UserService {
  BaseRepository _dio = locator<BaseRepository>();

  Future<User> fetchUser(User user) async {
    FormData formData = new FormData.fromMap({
      "email": user.email,
      "password": user.password,
    });
    final response =
        await _dio.getInstance().post('/login', data: {"user": user.toJson()});
    return User.fromJson(response.data);
  }
}
