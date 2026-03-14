import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/wishlist/data/models/wishlist_response/wishlist_response.dart';

class WishlistRepo {
  Future<WishlistResponse?> getWishlist() async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.wishlist,
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return WishlistResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<WishlistResponse?> addToWishlist(int productId) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.addToWishlist,
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return WishlistResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<WishlistResponse?> removeFromWishlist(int productId) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.removeFromWishlist,
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return WishlistResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
