import 'package:bookia/core/services/dio/api/handle_dio_error.dart';
import 'package:bookia/core/services/dio/api/handle_response.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PatchApi {
  static Future<Either<Failure, dynamic>> patchApi({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await DioProvider.dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return HandleResponse.handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(HandleDioError.handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something went wrong"));
    }
  }

 
}
