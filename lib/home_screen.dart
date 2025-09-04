// home_screen.dart
import 'package:flutter/material.dart';
import 'listing_service.dart';
import 'listing_card.dart';
import 'category_filter.dart';
import 'listing_screen.dart'; // ✅ correct path

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "All";
  String stock = "available";
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
    final filtered = _service.filter(category: selectedCategory, stock: stock);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Marketplace",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          CategoryFilter(
            categories: ["All", "Phones", "PCs", "Appliances"],
            selectedCategory: selectedCategory,
            onCategorySelected: (c) => setState(() => selectedCategory = c),
          ),
          const SizedBox(height: 12),
          Row(children: [
            ChoiceChip(
              label: const Text("Available"),
              selected: stock == "available",
              onSelected: (_) => setState(() => stock = "available"),
            ),
            const SizedBox(width: 8),
            ChoiceChip(
              label: const Text("Sold"),
              selected: stock == "sold",
              onSelected: (_) => setState(() => stock = "sold"),
            ),
          ]),
          const SizedBox(height: 12),
          ...filtered
              .map((listing) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: ListingCard(
              key: ValueKey(listing.id),
              listing: listing,
            ),
          ))
              .toList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddListingScreen()), // ✅ class found
        ),
      ),
    );
  }
}