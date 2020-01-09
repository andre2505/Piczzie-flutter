import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:piczzie/model/gift.dart';
import 'package:piczzie/service/base_network/base_repository.dart';
import 'package:piczzie/service/service_locator.dart';

class GiftRepository {

  BaseRepository _dio = locator<BaseRepository>();

  Future<List<Gift>> getListGift(String id, int offset) async {
    final response = await _dio.getInstance().get(
        '/api/gift/user/' + id,
        queryParameters: {"offset": offset});
    var giftList = response.data as List;
    return giftList.map((i) => Gift.fromJson(i)).toList();
  }
}
