import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/search/data/model/search_response/search_response.dart';
import 'package:bookia/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchBooksUseCase {
  final SearchRepo searchRepo;
  SearchBooksUseCase(this.searchRepo);
  Future<Either<Failure, SearchResponse>> call(String name) async {
    return await searchRepo.search(name);
  }
}
