import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitialState());
  Future<void> addToWishlist(int productId) async {
    emit(DetailsLoadingState());
    var data = await WishlistRepo().addToWishlist(productId);
    if (data != null) {
      emit(DetailsSuccessState());
    } else {
      emit(DetailsErrorState());
    }
  }
}
