import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/best_sellers_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetBestSellersUseCase {
  final HomeRepo homeRepo;
  GetBestSellersUseCase(this.homeRepo);
  Future<Either<Failure, BestSellersResponse>> call() async {
    return await homeRepo.getBestSellers();
  }
}
