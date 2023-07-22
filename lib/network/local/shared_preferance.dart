import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // ignore: body_might_complete_normally_nullable
  static dynamic getData({required String key}) {
    // ignore: await_only_futures
    if (sharedPreferences == null) {
      init();
    } else {
      dynamic val = sharedPreferences?.get(key);
      return val;
    }
  }

  static Future<bool?> savedata({
    required String key,
    required dynamic value,
  }) async {
    bool? val;
    if (sharedPreferences == null) {
      init();
    } else {
      if (value is String) {
        val = await sharedPreferences?.setString(key, value);
      }

      if (value is int) {
        val = await sharedPreferences?.setInt(key, value);
      }

      if (value is bool) {
        val = await sharedPreferences?.setBool(key, value);
      }
      if (value is double) {
        val = await sharedPreferences?.setDouble(key, value);
      }
      return val;
    }
  }
}
