import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/model/user.dart';
import 'package:piczzie/service/base_network/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:piczzie/service/base_network/navigation_service.dart';
import 'package:piczzie/service/user_session.dart';

class ApiBaseHelper {
  final String _baseUrl = "http://localhost:8080";

  String _refreshToken;

  Map<String, String> _header;

  dynamic body;

  ApiBaseHelper() {
    getToken();
    getRefreshToken();
  }

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url, headers: _header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, @nullable dynamic body) async {
    var responseJson;
    this.body = body;
    try {
      if (url != "/login") {
        final response =
            await http.post(_baseUrl + url, headers: _header, body: body);
        responseJson = _returnResponse(response);
      } else {
        final response = await http.post(_baseUrl + url, body: body);
        responseJson = _returnResponse(response);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url) async {
    var responseJson;
    try {
      final response = await http.put(_baseUrl + url, headers: _header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var responseJson;
    try {
      final response = await http.delete(_baseUrl + url, headers: _header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        RefreshToken(response.request);
        break;
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<void> RefreshToken(http.BaseRequest request) async {
    final response =
        await http.post(_baseUrl + '/token', body: this._refreshToken);
    if (response.statusCode == 401 || response.statusCode == 403) {
      UserSession.setTokenPreference(null);
      UserSession.setRefreshTokenPreference(null);
      locator<NavigationService>().navigateTo('/login');
    } else {
      UserSession.setTokenPreference(
          User.fromJson((_returnResponse(response))).token);

      UserSession.setRefreshTokenPreference(
          User.fromJson(json.decode(response.body)).refreshToken);

      getToken();
      request.headers.clear();
      request.headers.remove("Authorization");
      request.headers.addAll(_header);
      post(request.url.toString(), (body != null) ? this.body : null);
    }
  }

  getToken() async {
    await UserSession.getTokenPreference().then((value) {
      this._header = {"Authorization" :"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1YzYxNmVlNzlhNjM0NTE4NTJhNDkyYjYiLCJ1c2VyIjp7Il9pZCI6IjVjNjE2ZWU3OWE2MzQ1MTg1MmE0OTJiNiIsImZpcnN0bmFtZSI6ImRkIiwibGFzdG5hbWUiOiJ0b3RvIiwiZ2VuZGVyIjoxLCJlbWFpbCI6InRvdG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiIkMmEkMTAkcjBTZFU1WkMxVUJOQzZYZXdTV1h2LmttdnlEODRsSlZhbnFUMXlCamVxZmRGeldWZUZ1UXkiLCJiaXJ0aGRheSI6IjIwMTktMDEtMjFUMTI6NTg6MzYuMDAwWiIsImZyaWVuZHMiOlt7Il9pZCI6IjVkZWU0Y2U5MzhkNDQ4MTQ2ZDY4NTA4OSIsImZyaWVuZHNfaWQiOiI1Y2I5NzhkZDRhNzY4NTBmMjZiMDhmZTUiLCJzdGF0ZSI6MX1dLCJwaG90byI6IklNR18yMDE5MTIxN18wMDEzMTMuanBnIiwiX192IjowfSwiaWF0IjoxNTc4NDAxNTgwLCJleHAiOjE1Nzg0ODc5ODB9.oNd3cZ3pR54tjJXGbvXQviDFzt43oRBabAxLPeckx4Q"};//{"Authorization": "$value"};
    }).catchError((error) {
      return "";
    });
  }

  getRefreshToken() async {
    await UserSession.getRefreshTokenPreference().then((value) {
      this._refreshToken = value;
    }).catchError((error) {
      return "";
    });
  }
}
