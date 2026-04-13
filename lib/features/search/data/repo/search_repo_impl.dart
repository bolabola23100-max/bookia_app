import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookia/features/search/data/model/search_response/search_response.dart';
import 'package:bookia/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, SearchResponse>> search(String name) async {
    return await searchRemoteDataSource.search(name);
  }
}
