import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/api/get_api.dart';
import 'package:bookia/core/services/dio/api/post_api.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/place_order/data/models/governorates_response/governorates_response.dart';
import 'package:dartz/dartz.dart';

class PlaceOrderRepo {
  static Future<Either<Failure, GovernoratesResponse>> getGovernorates() async {
    var response = await GetApi.getApi(endpoint: Apis.governorates);
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        var data = GovernoratesResponse.fromJson({'data': r});
        return Right(data);
      },
    );
  }

  static Future<Either<Failure, bool>> placeOrder({
    required String name,
    required String email,
    required String address,
    required String phone,
    required int governorateId,
  }) async {
    var response = await PostApi.postApi(
      endpoint: Apis.placeOrder,
      data: {
        "name": name,
        "email": email,
        "address": address,
        "phone": phone,
        "governorate_id": governorateId,
      },
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(true);
      },
    );
  }
}
