import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'sample_data.dart';
import 'listing_card.dart';
import 'category_filter.dart';

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
      final matchesCategory = selectedCategory == "All" || listing.category == selectedCategory;
      final matchesQuery = query.isEmpty || listing.title.toLowerCase().contains(query.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          onChanged: (val) => setState(() => query = val),
          decoration: const InputDecoration(
            hintText: "Search for electronics...",
            border: InputBorder.none,
          ),
        ),
      ),
      body: Column(
        children: [
          CategoryFilter(
            categories: const ["All", "Phones", "PCs", "Appliances"],
            selectedCategory: selectedCategory,
            onCategorySelected: (category) => setState(() => selectedCategory = category),
          ),
          Expanded(
            child: AnimationLimiter(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: filteredListings.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: ListingCard(listing: filteredListings[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}