// search_screen.dart
import 'package:flutter/material.dart';
import 'listing_service.dart';
import 'listing_card.dart';
import 'category_filter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key}); // ✅ added key

  @override
  State<SearchScreen> createState() => _SearchScreenState(); // ✅ fixed private state leak
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCategory = "All";
  String query = "";
  int minStars = 0;

  final ListingService _service = ListingService.instance;

  @override
  void initState() {
    super.initState();
    _service.addListener(_onServiceChanged);
  }

  @override
  void dispose() {
    _service.removeListener(_onServiceChanged);
    super.dispose();
  }

  void _onServiceChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final filtered = _service
        .filter(category: selectedCategory, minStars: minStars)
        .where((l) =>
    query.isEmpty || l.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            onChanged: (v) => setState(() => query = v),
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
          onCategorySelected: (c) => setState(() => selectedCategory = c),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              for (int i = 0; i <= 5; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    // ✅ removed unnecessary braces around i
                    label: Text(i == 0 ? "All Ratings" : "$i★ & up"),
                    selected: minStars == i,
                    onSelected: (_) => setState(() => minStars = i),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView(
            children:
            filtered.map((listing) => ListingCard(listing: listing)).toList(),
          ),
        )
      ]),
    );
  }
}