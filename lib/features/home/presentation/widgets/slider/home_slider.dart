import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/shimmer/home_slider_shimmer.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          var sliders = context.read<HomeCubit>().sliders;
          return Column(
            children: [
              CarouselSlider.builder(
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        sliders[index].image ?? "",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
                itemCount: sliders.length,
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: 1,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: sliders.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: AppColors.primaryColor,
                      dotColor: AppColors.gray,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is HomeErrorState) {
          return Text("error".tr());
        } else {
          return const HomeSliderShimmer();
        }
      },
    );
  }
}
