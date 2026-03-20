import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/core/widgets/shimmer/best_seller_shimmer.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/product.dart';
import 'package:bookia/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookia/features/search/presentation/widgets/search_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leadingWidth: 70,
              leading: const CustomBackButton(),
            ),
            body: SafeArea(
              child: SingleChildScrollView( // رجعنا الـ Scroll الخارجي اللي كنت عامله
                child: Column(
                  children: [
                    const Gap(15),
                    CustomTextFormField(
                      hintText: 'Search Store',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(AppIcons.search),
                      ),
                      onChanged: (value) {
                        context.read<SearchCubit>().search(value);
                      },
                    ),
                    const Gap(25),
                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        if (state is SearchErrorState) {
                          return const Center(child: Text("Error"));
                        } else if (state is SearchLoadingState) {
                          return const BestSellerShimmer();
                        } else if (state is SearchSuccessState) {
                          if (state.products.isEmpty) {
                            return const Center(
                              child: Text("No results found"),
                            );
                          }
                          return GridView.builder(
                            shrinkWrap: true, // دي اللي بتخليه يشتغل جوه SingleChildScrollView
                            physics: const NeverScrollableScrollPhysics(), // بنقفل السكرول الداخلي
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            itemCount: state.products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.65,
                            ),
                            itemBuilder: (context, index) {
                              var product = Product.fromJson(
                                state.products[index],
                              );
                              return SearchCard(product: product);
                            },
                          );
                        }
                        return const Center(
                          child: Text("Search for your favorite books!"),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
