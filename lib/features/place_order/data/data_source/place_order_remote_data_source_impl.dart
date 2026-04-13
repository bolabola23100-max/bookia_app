import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/api/get_api.dart';
import 'package:bookia/core/services/dio/api/post_api.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/place_order/data/data_source/place_order_remote_data_source.dart';
import 'package:bookia/features/place_order/data/models/governorates_response/governorates_response.dart';
import 'package:dartz/dartz.dart';

class PlaceOrderRemoteDataSourceImpl extends PlaceOrderRemoteDataSource {
  @override
  Future<Either<Failure, GovernoratesResponse>> getGovernorates() async {
    var response = await GetApi.getApi(endpoint: Apis.governorates);
    return response.fold(
      (l) => Left(l),
      (r) {
        var data = GovernoratesResponse.fromJson({'data': r});
        return Right(data);
      },
    );
  }

  @override
  Future<Either<Failure, bool>> placeOrder({
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
      (l) => Left(l),
      (r) => const Right(true),
    );
  }
}
