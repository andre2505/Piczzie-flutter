import 'dart:convert';

import 'package:http/http.dart';
import 'package:piczzie/service/result_service.dart';

abstract class BaseService{
  final String f = "http";
  ResultService resultService<T>(Response response, T object){
    switch (response.statusCode) {
      case 200:
        {
          return ResultService.success(object);
        }
      case 404:
        {
          return ResultService.error("error SOCIAL");
        }
    }
  }

}