import 'package:bookia/core/services/dio/base_response.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HandleResponse {
  static Either<Failure, dynamic> handleResponse(Response<dynamic> response) {
    var json = response.data as Map<String, dynamic>;
    if (json.containsKey('data')) {
      try {
        var baseResponse = BaseResponse.fromJson(response.data);
        return Right(baseResponse.data);
      } on Exception catch (e) {
        return Left(ParsingFailure(message: e.toString()));
      }
    } else {
      return Right(response.data);
    }
  }
}
