import 'package:flutter/material.dart';
import 'sample_sellers.dart';
import 'seller_card.dart';
import 'seller_profile_screen.dart';
import 'page_transition.dart';

class TopSellersScreen extends StatelessWidget {
  const TopSellersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Sellers"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sampleSellers.length,
        itemBuilder: (context, index) {
          final seller = sampleSellers[index];
          return SellerCard(
            seller: seller,
            onTap: () {
              Navigator.push(context, FadeSlidePageRoute(page: SellerProfileScreen(seller: seller)));
            },
          );
        },
      ),
    );
  }
}