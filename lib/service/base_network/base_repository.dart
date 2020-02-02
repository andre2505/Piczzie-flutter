import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:piczzie/configuration/app_config.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/service/user_session.dart';

import 'navigation_service.dart';

class BaseRepository {
  Dio dio;
  String token;
  String refreshToken;
  BuildContext context;

  BaseRepository(this.context) {
    initInstanceApi();
  }

  void initInstanceApi() async {
    print(AppConfig.of(context).endpoint);
    token = await UserSession.getTokenPreference();
    refreshToken = await UserSession.getRefreshTokenPreference();
    _initApi();
  }

  _initApi() {
    dio = Dio();
    dio.options.baseUrl = AppConfig.of(context).endpoint;
    dio.options.headers['Authorization'] = "bearer " + token;
    dio.options.headers['content-type'] = "application/x-www-form-urlencoded";
    dio.options.connectTimeout = 30000; //5s
    dio.options.receiveTimeout = 30000;
    dio.interceptors
        .add(InterceptorsWrapper(onError: (DioError dioError) async {
      Response response;
      RequestOptions responseRequest;
      if (dioError.response?.statusCode == 401 ||
          dioError.response?.statusCode == 403) {
        dio.interceptors.requestLock.lock();
        dio.interceptors.responseLock.lock();

        responseRequest = dioError.response.request;

        Dio dioRefresh = Dio();
        dioRefresh.options.headers['content-type'] =
            "application/x-www-form-urlencoded";
        response = await dioRefresh
            .post("http://localhost:8080/token", data: {"token": refreshToken});
        dio.interceptors.requestLock.unlock();
        dio.interceptors.responseLock.unlock();

        UserSession.setTokenPreference(response.data["token"]);
        UserSession.setRefreshTokenPreference(response.data["refresh_token"]);

        if (response.statusCode == 200) {
          Dio dioRetry = Dio();
          dioRetry.options.headers["content-type"] =
              "application/x-www-form-urlencoded";
          dioRetry.lock();

          token = await UserSession.getTokenPreference();
          refreshToken = await UserSession.getTokenPreference();
          dioRetry.options.headers['Authorization'] = "bearer $token";

          dioRetry.unlock();

          response = await dioRetry.request(
              "http://localhost:8080" + responseRequest.path,
              data: responseRequest.data,
              options: Options(method: responseRequest.method));

          return response;
        } else {
          locator<NavigationService>().navigateTo('/login');
        }
      }
      return null;
    }));
  }

  Dio getInstance() => dio;
}
