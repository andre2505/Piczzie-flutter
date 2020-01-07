import 'package:http/http.dart' as http;
import 'package:piczzie/model/gift.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:piczzie/model/user.dart';
import 'package:piczzie/service/base_network/api_base_helper.dart';

class UserService {

  ApiBaseHelper _helper = locator<ApiBaseHelper>();

  Future<User> fetchUser(User user) async {
    final response =
        await _helper.post('/login', user.toJson());
    return User.fromJson(response);
  }

  Future<List<Gift>> getListGift(String id) async {
    final response = await _helper.get('/api/gift/user/'+id);
    var giftList = response as List;
        return giftList.map((i) => Gift.fromJson(i)).toList();
  }
}
