import 'dart:io';

import 'package:bookia/app/ThemeData.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/details/presentation/widgets/cart_action/cubit/cart_action_cubit.dart';
import 'package:bookia/features/details/presentation/widgets/wishlist_action/cubit/wishlist_action_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/place_order/presentation/cubit/place_order_cubit.dart';
import 'package:bookia/features/profile/presentation/cubit/history/history_cubit.dart';
import 'package:bookia/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileCubit()..getProfile()),
        BlocProvider(create: (context) => CartCubit()..getCart()),
        BlocProvider(create: (context) => WishlistCubit()..getWishlist()),
        BlocProvider(create: (context) => HomeCubit()..inetLoadData()),
        BlocProvider(create: (context) => HistoryCubit()..getOrderHistory()),
        BlocProvider(create: (context) => PlaceOrderCubit()),
        BlocProvider(create: (context) => WishlistActionCubit()),
        BlocProvider(create: (context) => CartActionCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: themeData(),
        routerConfig: router,
        builder: (context, child) {
          return SafeArea(
            top: false,
            bottom: Platform.isAndroid,
            child: child ?? Scaffold(),
          );
        },
      ),
    );
  }
}
