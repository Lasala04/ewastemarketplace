// user_listings_view.dart

import 'package:flutter/material.dart';
import 'listing.dart'; // ✅ FIX: Added the missing import for the Listing class
import 'sample_data.dart';
import 'listing_card.dart';

class UserListingsView extends StatefulWidget {
  const UserListingsView({super.key});

  @override
  State<UserListingsView> createState() => _UserListingsViewState();
}

class _UserListingsViewState extends State<UserListingsView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeListings = sampleListings.where((l) => !l.isSold).toList();
    final pastListings = sampleListings.where((l) => l.isSold).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: Colors.green,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Active Listings"),
            Tab(text: "History"),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 260, // Set a fixed height for the TabBarView
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildListingGrid(activeListings),
              _buildListingGrid(pastListings),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListingGrid(List<Listing> listings) {
    if (listings.isEmpty) {
      return const Center(child: Text("No listings found.", style: TextStyle(color: Colors.grey)));
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: listings.length,
      itemBuilder: (context, index) {
        return ListingCard(listing: listings[index]);
      },
    );
  }
}