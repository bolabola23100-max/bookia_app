import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/profile/data/model/order_history_response/order_history_response.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';

class GetOrderHistoryUseCase {
  final ProfileRepo profileRepo;
  GetOrderHistoryUseCase(this.profileRepo);
  Future<Either<Failure, OrderHistoryResponse>> call() async {
    return await profileRepo.getOrderHistory();
  }
}
