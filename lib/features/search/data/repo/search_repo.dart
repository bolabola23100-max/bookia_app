import 'dart:developer';

import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/features/search/data/model/search_response/search_response.dart';

class SearchRepo {
  Future<SearchResponse?> search(String name) async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.search,
        queryParameters: {"name": name},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return SearchResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
