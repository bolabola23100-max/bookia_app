import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/search/data/model/search_response/search_response.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRemoteDataSource {
  Future<Either<Failure, SearchResponse>> search(String name);
}
