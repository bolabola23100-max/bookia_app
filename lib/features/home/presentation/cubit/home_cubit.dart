import 'package:bookia/features/home/data/models/best_sellers_response/best_sellers_response.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/product.dart';
import 'package:bookia/features/home/data/models/slider_response/slider.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Slider> sliders = [];
  List<Product> products = [];
  Future<void> inetLoadData() async {
    emit(HomeLoadingState());

    var responses = await Future.wait([
      HomeRepo.getSlider(),
      HomeRepo.getBestSellers(),
    ]);

    bool isSuccess = false;

    responses[0].fold(
      (l) => null,
      (r) {
        sliders = (r as SliderResponse).data?.sliders ?? [];
        isSuccess = true;
      },
    );

    responses[1].fold(
      (l) => null,
      (r) {
        products = (r as BestSellersResponse).data?.products ?? [];
        isSuccess = true;
      },
    );

    if (isSuccess) {
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState());
    }
  }
}
