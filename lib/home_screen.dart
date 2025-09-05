import 'package:flutter/material.dart';
import 'sample_data.dart';
import 'sample_sellers.dart';
import 'horizontal_listing_carousel.dart';
import 'horizontal_seller_carousel.dart';
import 'notifications_screen.dart';
import 'search_screen.dart';
import 'page_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: const Text("EcoByte", style: TextStyle(fontWeight: FontWeight.bold)),
            actions: [
              // ✅ FIX: Search bar is back and functional
              IconButton(
                onPressed: () => Navigator.of(context).push(FadeSlidePageRoute(page: const SearchScreen())),
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).push(FadeSlidePageRoute(page: const NotificationsScreen())),
                icon: const Icon(Icons.notifications_none_rounded),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 10),
              HorizontalListingCarousel(title: "Top Selling", listings: topSellingItems),
              HorizontalSellerCarousel(title: "Top Sellers", sellers: sampleSellers), // 🚀 UPDATE
              HorizontalListingCarousel(title: "Top Rated", listings: topRatedItems),
              HorizontalListingCarousel(title: "Recently Added", listings: recentItems),
            ]),
          ),
        ],
      ),
    );
  }
}