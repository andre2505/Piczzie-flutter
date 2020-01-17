import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:piczzie/model/gift.dart';
import 'package:piczzie/service/base_network/base_repository.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/model/user.dart';

class UserService {
  BaseRepository _dio = locator<BaseRepository>();

  Future<User> fetchUser(User user) async {
    final response =
        await _dio.getInstance().post('/login', data: user.toJson());
    print(response.data);
    return User.fromJson(response.data);
  }

  Future<List<Response>> getAllInformationsUser(String id, int offset) async {
    final response = await Future.wait([
      _dio
          .getInstance()
          .get("/api/gift/user/$id", queryParameters: {"offset": offset}),
      _dio.getInstance().get("/api/child/children/$id"),
      _dio.getInstance().get("/api/user/$id")
    ]);
    return response;
  }
}
