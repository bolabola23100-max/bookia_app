import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetSlidersUseCase {
  final HomeRepo homeRepo;
  GetSlidersUseCase(this.homeRepo);
  Future<Either<Failure, SliderResponse>> call() async {
    return await homeRepo.getSlider();
  }
}
