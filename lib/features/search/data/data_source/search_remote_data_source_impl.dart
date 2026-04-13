import 'dart:developer';
import 'package:bookia/core/services/dio/api/get_api.dart';
import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookia/features/search/data/model/search_response/search_response.dart';
import 'package:dartz/dartz.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  @override
  Future<Either<Failure, SearchResponse>> search(String name) async {
    try {
      var response = await GetApi.getApi(
        endpoint: Apis.search,
        queryParameters: {"name": name},
      );
      return response.fold(
        (l) => Left(l),
        (r) {
          var data = SearchResponse.fromJson({'data': r});
          return Right(data);
        },
      );
    } catch (e) {
      log(e.toString());
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
