// home_screen.dart
import 'package:flutter/material.dart';
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
            categories: ["All", "Phones", "PCs", "Appliances"],
            selectedCategory: selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
          const SizedBox(height: 12),
          ...filteredListings.map(
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
          ),
        ],
      ),
    );
  }
}