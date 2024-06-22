import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static SharedPreferences? prefs;

  static initSharedPreferences() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await prefs!.setString(key, value);
    } else if (value is int) {
      return await prefs!.setInt(key, value);
    } else if (value is bool) {
      return await prefs!.setBool(key, value);
    } else if (value is double) {
      return await prefs!.setDouble(key, value);
    } else if (value is List<String>) {
      return await prefs!.setStringList(key, value);
    } else {
      return false;
    }
  }

  static String getToken() {
    return prefs?.getString('token') ?? '';
  }

  static String getPhoneNumber() {
    return prefs?.getString('phoneNumber') ?? '';
  }

  static String getString(String key) {
    return prefs?.getString(key) ?? '';
  }

  static int getInt(String key) {
    return prefs?.getInt(key) ?? 0;
  }

  static String getUUID() {
    print(prefs?.getString('UUID'));
    return prefs?.getString('UUID') ?? "";
  }

  static int getUserId() {
    return prefs?.getInt('userId') ?? 0;
  }

  static int? getChatUniqueID() {
    return prefs?.getInt('UniqueChatID');
  }

  static int? setCurrentIndex(int value) {
    var cIndex = prefs?.setInt('currentIndex', value);
    return int.tryParse(cIndex as String);
  }

  static int getTokenTimeOrCartId(String key) {
    return prefs?.getInt(key) ?? 0;
  }

  static bool checkOnBoarding(String key) {
    return prefs?.getBool(key) ?? false;
  }

  static bool check(String key) {
    return prefs?.containsKey(key) ?? false;
  }

  static void clearChatUniqueID() {
    prefs?.remove('UniqueChatID');
  }

  static void clearTokenProperties() {
    prefs?.remove('token');
    prefs?.remove('phoneNumber');
  }

  static void clearPhoneNumber(key) {
    prefs?.remove(key);
  }

  static Future<bool?> saveSearchHistory(List<String> searchHistories) async {
    return await prefs?.setStringList('demand_search_history', searchHistories);
  }

  static List<String> getSearchAddress() {
    return prefs?.getStringList('demand_search_history') ?? [];
  }

  static Future<Future<bool>?> clearSearchHistory() async {
    return prefs?.setStringList('demand_search_history', []);
  }
}
