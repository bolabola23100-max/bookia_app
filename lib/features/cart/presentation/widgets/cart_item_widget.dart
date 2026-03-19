import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is! CartSuccessState) {
          return Center(child: CircularProgressIndicator());
        } else {
          var cubit = context.read<CartCubit>();
          if (cubit.products.isEmpty) {
            return Center(child: Text('No Books in cart'));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: ListView.separated(
              itemCount: cubit.products.length,
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(color: AppColors.lightGray),
              ),
              itemBuilder: (context, index) {
                return CartItemTile(
                  item: cubit.products[index],
                  onRemove: () {
                    cubit.removeFromCart(cubit.products[index].itemId ?? 0);
                  },
                  onUpdate: (count) {
                    cubit.updateCart(cubit.products[index].itemId ?? 0, count);
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
