// search_screen.dart
import 'package:flutter/material.dart';
import 'sample_data.dart';
import 'listing_card.dart';
import 'category_filter.dart';
import 'chat_screen.dart'; // 👈 Add this import

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCategory = "All";
  String query = "";

  @override
  Widget build(BuildContext context) {
    final filteredListings = sampleListings.where((listing) {
      final matchesCategory =
          selectedCategory == "All" || listing.category == selectedCategory;
      final matchesQuery =
          query.isEmpty || listing.title.toLowerCase().contains(query.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  query = val;
                });
              },
              decoration: InputDecoration(
                hintText: "Search electronics...",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Category Filter
          CategoryFilter(
            categories: ["All", "Phones", "PCs", "Appliances"],
            selectedCategory: selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),

          Expanded(
            child: ListView(
              children: filteredListings
                  .map((listing) => ListingCard(
                listing: listing,
                onMessage: () {
                  // Navigate to chat
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(seller: listing.seller),
                    ),
                  );
                },
              ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
