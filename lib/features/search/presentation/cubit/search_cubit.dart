import 'package:bookia/features/search/data/repo/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  SearchRepo searchRepo = SearchRepo();

  Future<void> search(String name) async {
    emit(SearchLoadingState());
    var result = await searchRepo.search(name);
    if (result != null) {
  emit(SearchSuccessState(products: result.data?.products ?? []));
    } else {
      emit(SearchErrorState());
    }
  }
}
