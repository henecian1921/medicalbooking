import 'package:shared_preferences/shared_preferences.dart';

class SharedPre {
  static SharedPreferences? _prefs;
  static SharedPreferences? _pref2;

  static const _keyToken = 'token';
  static const _userId = 'userId';
  // Hàm để khởi tạo SharedPreferences
  static Future initShared() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Hàm để lưu token
  static Future setToken(String token) async {
    await _prefs?.setString(_keyToken, token);
  }

  // Hàm để lấy token
  static String? getToken() {
    return _prefs?.getString(_keyToken);
  }

  // Hàm để xóa token
  static Future clearToken() async {
    await _prefs?.remove(_keyToken);
  }

  static Future initShare() async {
    _pref2 = await SharedPreferences.getInstance();
  }

  // Hàm để lưu token
  static Future setUserId(String userId) async {
    await _pref2?.setString(_userId, userId);
  }

  // Hàm để lấy token
  static String? getUserId() {
    return _pref2?.getString(_userId);
  }

  // Hàm để xóa token
  static Future clearUserId() async {
    await _pref2?.remove(_userId);
  }
}
