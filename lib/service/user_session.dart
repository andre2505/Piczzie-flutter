import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  static final String KEY_TOKEN = "key_token";
  static final String KEY_REFRESH_TOKEN = "key_refresh_token";

  static void setTokenPreference(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(KEY_TOKEN, token);
  }

  static Future<String> getTokenPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_TOKEN);
  }

  static void setRefreshTokenPreference(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(KEY_REFRESH_TOKEN, token);
  }

  static Future<String> getRefreshTokenPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_REFRESH_TOKEN);
  }
}
