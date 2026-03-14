import 'dart:convert';

import 'package:bookia/features/auth/data/models/auth_response/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  static late SharedPreferences pref;
  static const String tokenKey = "token";
  static const String userKey = "user";
  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String token) async {
    await pref.setString(tokenKey, token);
  }

  static String? getToken() {
    return pref.getString(tokenKey);
  }

  static Future<void> setUserInfo(User? model) async {
    if (model == null) {
      return;
    }
    var userJson = model.toJson();
    var userJsonString = jsonEncode(userJson);
    await pref.setString(userKey, userJsonString);
  }

  static User? getUserInfo() {
    var cachedUser = pref.getString(userKey);
    if (cachedUser == null) {
      return null;
    }
    var userJson = jsonDecode(cachedUser);
    var userObject = User.fromJson(userJson);
    return userObject;
  }

  static Future<void> cacheData(String key, dynamic value) async {
    if (value is String) {
      await pref.setString(key, value);
    } else if (value is int) {
      await pref.setInt(key, value);
    } else if (value is bool) {
      await pref.setBool(key, value);
    } else if (value is double) {
      await pref.setDouble(key, value);
    }
  }

  static String getData(String key) {
    return pref.getString(key) ?? "";
  }

  static Future<void> removeData(String key) async {
    await pref.remove(key);
  }

  static Future<void> clearData() async {
    await pref.clear();
  }
}
