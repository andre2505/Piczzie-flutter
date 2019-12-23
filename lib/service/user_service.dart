import 'package:http/http.dart' as http;
import 'package:piczzie/model/user.dart';
import 'package:piczzie/service/base_service.dart';
import 'dart:convert';

import 'package:piczzie/service/result_service.dart';

class UserService extends BaseService {
  UserService() : super();

  Future<ResultService> getUser(User user) async {
    final response =
        await http.post('http://localhost:8080/login', body: user.toJson());
    return resultService(response, User.fromJson(json.decode(response.body)));
  }
}
