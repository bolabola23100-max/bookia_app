import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/wishlist/presentation/widgets/wishlist_books.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("wishlist".tr(), style: TextStyles.fs20)),
      ),
      body: SingleChildScrollView(
        child: const SafeArea(child: WishlistBooks()),
      ),
    );
  }
}
