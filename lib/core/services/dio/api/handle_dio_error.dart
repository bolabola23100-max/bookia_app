import 'package:bookia/core/services/dio/failure.dart';
import 'package:dio/dio.dart';

class HandleDioError {
  static Failure handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NetworkFailure(message: "Please check your internet connection");
      case DioExceptionType.badResponse:
        return ApiFailure(message: e.response?.data['message']);
      case DioExceptionType.cancel:
        return ApiFailure(message: "Request cancelled");
      case DioExceptionType.unknown:
        return UnknownFailure(message: "Something went wrong");

      default:
        return UnknownFailure(message: "Something went wrong");
    }
  }
}
