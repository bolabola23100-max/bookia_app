import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/best_sellers_response.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, SliderResponse>> getSlider() async {
    return await homeRemoteDataSource.getSlider();
  }

  @override
  Future<Either<Failure, BestSellersResponse>> getBestSellers() async {
    return await homeRemoteDataSource.getBestSellers();
  }
}
