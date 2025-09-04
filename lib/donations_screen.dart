import 'package:flutter/material.dart';
import 'listing_service.dart';
import 'listing_card.dart';

class DonationsScreen extends StatefulWidget {
  const DonationsScreen({super.key});

  @override
  _DonationsScreenState createState() => _DonationsScreenState();
}

class _DonationsScreenState extends State<DonationsScreen> {
  final ListingService _service = ListingService.instance;

  @override
  void initState() {
    super.initState();
    // Rebuild when the service notifies (listings added/removed/updated)
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
    final donations = _service.filter(donationsOnly: true);

    return Scaffold(
      appBar: AppBar(title: const Text("Donations")),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: donations.isEmpty
            ? [
          const SizedBox(height: 50),
          const Center(
            child: Text(
              "No donation items available right now.",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          )
        ]
            : donations.map((listing) => ListingCard(listing: listing)).toList(),
      ),
    );
  }
}