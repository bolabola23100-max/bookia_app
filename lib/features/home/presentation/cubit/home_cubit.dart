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

    var response = await Future.wait([
      HomeRepo.getSlider(),
      HomeRepo.getBestSellers(),
    ]);
    var sliderResponse = response[0] as SliderResponse?;
    var bestSellersResponse = response[1] as BestSellersResponse?;

    if (sliderResponse != null || bestSellersResponse != null) {
      sliders = sliderResponse?.data?.sliders ?? [];
      products = bestSellersResponse?.data?.products ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState());
    }
  }
}
