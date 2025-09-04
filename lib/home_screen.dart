// home_screen.dart
import 'package:flutter/material.dart';
import 'sample_data.dart';
import 'listing_card.dart';
import 'category_filter.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    final filteredListings = selectedCategory == "All"
        ? sampleListings
        : sampleListings.where((l) => l.category == selectedCategory).toList();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Marketplace",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
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
          ...filteredListings.map((listing) => ListingCard(
            listing: listing,
            onMessage: () {
              // Navigate to chat screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(seller: listing.seller),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}