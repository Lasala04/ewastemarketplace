import 'package:flutter/material.dart';
import 'seller.dart';
import 'seller_card.dart';
import 'page_transition.dart';
import 'seller_profile_screen.dart';

class HorizontalSellerCarousel extends StatelessWidget {
  final String title;
  final List<Seller> sellers;

  const HorizontalSellerCarousel({
    super.key,
    required this.title,
    required this.sellers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: sellers.length,
            itemBuilder: (context, index) {
              final seller = sellers[index];
              return SizedBox(
                // ✅ FIX: Slightly increased width to give more space for content
                width: 270,
                child: SellerCard(
                  seller: seller,
                  onTap: () => Navigator.push(context, FadeSlidePageRoute(page: SellerProfileScreen(seller: seller))),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}