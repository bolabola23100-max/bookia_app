import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/wishlist/presentation/widgets/wishlist_books.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Wishlist", style: TextStyles.fs20)),
      ),
      body: SingleChildScrollView(
        child: const SafeArea(child: WishlistBooks()),
      ),
    );
  }
}
