import 'package:flutter/material.dart';
// 🚀 UPDATE: Imported staggered animations package for a fluid list entrance.
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'sample_data.dart';
import 'listing_card.dart';
import 'category_filter.dart';
import 'chat_screen.dart';
import 'page_transition.dart';

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
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Marketplace",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_rounded),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
          // 🚀 UPDATE: Wrapped the list in animation widgets for a staggered fade-in effect.
          AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: filteredListings
                    .map(
                      (listing) => ListingCard(
                    listing: listing,
                    onMessage: () {
                      Navigator.push(
                        context,
                        FadeSlidePageRoute(
                          page: ChatScreen(seller: listing.seller),
                        ),
                      );
                    },
                  ),
                )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}