// search_screen.dart
import 'package:flutter/material.dart';
import 'sample_data.dart';
import 'listing_card.dart';
import 'category_filter.dart';
import 'chat_screen.dart';
import 'page_transition.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
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
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
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
        ],
      ),
    );
  }
}