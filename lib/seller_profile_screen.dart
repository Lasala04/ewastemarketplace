import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'seller.dart';
import 'rating_stars.dart';
import 'horizontal_listing_carousel.dart';

class SellerProfileScreen extends StatelessWidget {
  final Seller seller;
  const SellerProfileScreen({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: CachedNetworkImageProvider(seller.avatarUrl),
                    ),
                    const SizedBox(height: 12),
                    Text(seller.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingStars(rating: seller.rating, size: 20),
                        const SizedBox(width: 8),
                        Text("${seller.rating} (${seller.ratingCount} reviews)", style: TextStyle(color: Colors.grey[300], fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.chat_bubble_outline),
                  label: const Text("Message Seller"),
                  onPressed: () {},
                ),
              ),
              HorizontalListingCarousel(title: "Items for Sale", listings: seller.listings),
            ]),
          )
        ],
      ),
    );
  }
}