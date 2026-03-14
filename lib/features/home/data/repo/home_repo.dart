import 'dart:developer';

import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/best_sellers_response.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';

class HomeRepo {
  static Future<SliderResponse?> getSlider() async {
    try {
      var response = await DioProvider.get(endpoint: Apis.sliders);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return SliderResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BestSellersResponse?> getBestSellers() async {
    try {
      var response = await DioProvider.get(endpoint: Apis.productsBestseller);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return BestSellersResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
