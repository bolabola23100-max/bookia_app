import 'dart:developer';
import 'package:bookia/core/services/dio/api/get_api.dart';
import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/best_sellers_response.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';
import 'package:dartz/dartz.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<Either<Failure, SliderResponse>> getSlider() async {
    try {
      var response = await GetApi.getApi(endpoint: Apis.sliders);
      return response.fold(
        (l) => Left(l),
        (r) {
          var data = SliderResponse.fromJson({'data': r});
          return Right(data);
        },
      );
    } on Exception catch (e) {
      log(e.toString());
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BestSellersResponse>> getBestSellers() async {
    try {
      var response = await GetApi.getApi(endpoint: Apis.productsBestseller);
      return response.fold(
        (l) => Left(l),
        (r) {
          var data = BestSellersResponse.fromJson({'data': r});
          return Right(data);
        },
      );
    } on Exception catch (e) {
      log(e.toString());
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
