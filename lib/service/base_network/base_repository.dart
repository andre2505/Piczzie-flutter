import 'dart:io';

import 'package:dio/dio.dart';
import 'package:piczzie/model/user.dart';
import 'package:piczzie/service/user_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseRepository {
  Dio dio;
  String token;
  String refreshToken;

  BaseRepository() {
    initInstanceApi();
  }

  void initInstanceApi() async {
    token = await UserSession.getTokenPreference();
    refreshToken = await UserSession.getRefreshTokenPreference();
    await _initApi();
  }

  _initApi() {
    dio = Dio();
    dio.options.baseUrl = "http://localhost:8080/";
    dio.options.headers['Authorization'] = "bearer " + token;
    dio.options.headers['content-type'] = "application/x-www-form-urlencoded";
    dio.options.connectTimeout = 30000; //5s
    dio.options.receiveTimeout = 30000;
    dio.interceptors
        .add(InterceptorsWrapper(onError: (DioError dioError) async {
      Response response;
      print(dioError);
      RequestOptions responseRequest;
      if (dioError.response?.statusCode == 401 ||
          dioError.response?.statusCode == 403) {
        dio.interceptors.requestLock.lock();
        dio.interceptors.responseLock.lock();
        responseRequest = dioError.response.request;
        print(responseRequest.method);
        FormData formData = new FormData.fromMap({"token": refreshToken});
        response = await dio.post("http://localhost:8080/api/user/token",
            data: formData,
            options: Options(
                contentType: "application/x-www-form-urlencoded",
                headers: {"Authorization": "bearer " + refreshToken}));
        print(response);
        dio.interceptors.requestLock.unlock();
        dio.interceptors.responseLock.unlock();
        if (response.statusCode == 200) {
          User user = User.fromJson(response.data);
          dio.interceptors.responseLock.lock();
          dio.interceptors.requestLock.lock();
          UserSession.setTokenPreference(user.token);
          UserSession.setRefreshTokenPreference(user.refreshToken);
          dio.interceptors.responseLock.unlock();
          dio.interceptors.requestLock.unlock();
          /*responseRequest.method
          dio.request(responseRequest.path, options: )*/
          return response;
        } else {
          print(response.data);
          return null;
        }
      } else {
        print(response.data);
        return null;
      }
    }));
  }

  Dio getInstance() => dio;
}
