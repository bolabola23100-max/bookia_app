import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/features/search/domain/usecases/search_books_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  Future<void> search(String name) async {
    emit(SearchLoadingState());
    var result = await getIt<SearchBooksUseCase>().call(name);
    result.fold(
      (l) {
        emit(SearchErrorState());
      },
      (r) {
        emit(SearchSuccessState(products: r.data?.products ?? []));
      },
    );
  }
}
