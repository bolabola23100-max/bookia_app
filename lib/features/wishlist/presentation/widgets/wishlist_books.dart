import 'package:bookia/core/widgets/shimmer/best_seller_shimmer.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/wishlist/presentation/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistBooks extends StatelessWidget {
  const WishlistBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        if (state is WishlistSuccessState) {
          var books = context.read<WishlistCubit>().products;
          if (books.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 250,
              ),
              child: Center(
                child: Text(
                  "No books in wishlist",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 250,
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              return WishlistCard(
                product: books[index],
                onRefresh: () {
                  context.read<WishlistCubit>().getWishlist();
                },
              );
            },
          );
        } else if (state is WishlistErrorState) {
          return Center(child: const Text("error"));
        } else {
          return const BestSellerShimmer();
        }
      },
    );
  }
}
