import 'dart:convert';

import 'package:bookia/features/auth/data/models/auth_response/user.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  static late SharedPreferences pref;
  static const String tokenKey = "token";
  static const String userKey = "user";
  static const String wishlistKey = "wishlist";
  static const String cartKey = "cart";
  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  //token
  static Future<void> setToken(String token) async {
    await pref.setString(tokenKey, token);
  }

  static String? getToken() {
    return pref.getString(tokenKey);
  }

  //user
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

  //wishlist
  static void cacheWishListIds(List<Product> items) {
    var ids = items.map((item) => item.id.toString()).toList();
    cacheData(wishlistKey, ids);
  }

  static List<int> getWishListIds() {
    var ids = pref.getStringList(wishlistKey);
    if (ids != null) {
      return ids.map((id) => int.tryParse(id) ?? 0).toList();
    } else {
      return [];
    }
  }
  //cart
  static void cacheCartItems(List<CartItem> items) {
    var ids = items.map((item) => item.itemProductId.toString()).toList();
    cacheData(cartKey, ids);
  }

  static List<int> getCartItemsIds() {
    var ids = pref.getStringList(cartKey);
    if (ids != null) {
      return ids.map((id) => int.tryParse(id) ?? 0).toList();
    } else {
      return [];
    }
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
    } else if (value is List<String>) {
      await pref.setStringList(key, value);
    }
  }

  static dynamic getData(String key) {
    return pref.getString(key) ?? "";
  }

  static Future<void> removeData(String key) async {
    await pref.remove(key);
  }

  static Future<void> clearData() async {
    await pref.clear();
  }
}
