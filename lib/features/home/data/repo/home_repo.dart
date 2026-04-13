import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/best_sellers_response.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, SliderResponse>> getSlider();
  Future<Either<Failure, BestSellersResponse>> getBestSellers();
}
