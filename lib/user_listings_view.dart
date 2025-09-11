import 'package:flutter/material.dart';
import 'listing_service.dart'; // ✅ FIX: Import service
import 'listing.dart';
import 'listing_card.dart';

class UserListingsView extends StatefulWidget {
  const UserListingsView({super.key});

  @override
  State<UserListingsView> createState() => _UserListingsViewState();
}

class _UserListingsViewState extends State<UserListingsView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ListingService _listingService = ListingService.instance;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // ✅ FIX: Listen for changes to update the UI
    _listingService.addListener(_onListingsChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _listingService.removeListener(_onListingsChanged);
    super.dispose();
  }

  void _onListingsChanged() {
    setState(() {}); // Re-render the widget when listings change
  }

  @override
  Widget build(BuildContext context) {
    // ✅ FIX: Get listings directly from the service
    final allUserListings = _listingService.allListings.where((l) => l.seller == 'John Doe').toList();
    final activeListings = allUserListings.where((l) => !l.isSold).toList();
    final pastListings = allUserListings.where((l) => l.isSold).toList();

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
          height: 260,
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