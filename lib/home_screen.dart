import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'sample_data.dart';
import 'listing_card.dart';
import 'category_filter.dart';
import 'chat_screen.dart';
import 'page_transition.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "All";
  @override
  Widget build(BuildContext context) {
    final filteredListings = selectedCategory == "All"
        ? sampleListings
        : sampleListings
        .where((l) => l.category == selectedCategory)
        .toList();
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Marketplace", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          // 🚀 UPDATE: Notification icon is now functional.
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(FadeSlidePageRoute(page: const NotificationsScreen()));
                },
                icon: const Icon(Icons.notifications_none_rounded, size: 28),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          CategoryFilter(
            categories: const ["All", "Phones", "PCs", "Appliances"],
            selectedCategory: selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
          const SizedBox(height: 12),
          AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(child: widget),
                ),
                children: filteredListings
                    .map((listing) => ListingCard(
                  listing: listing,
                  onMessage: () {
                    Navigator.push(context, FadeSlidePageRoute(page: ChatScreen(seller: listing.seller)));
                  },
                ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}