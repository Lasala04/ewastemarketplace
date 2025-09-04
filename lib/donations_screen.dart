import 'package:flutter/material.dart';
import 'sample_data.dart';
import 'listing_card.dart';

class DonationsScreen extends StatelessWidget {
  const DonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the `donation` field that exists on Listing
    final donationListings = sampleListings.where((l) => l.donation).toList();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text(
            "Donations",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          if (donationListings.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "No donation items available right now.",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            )
          else
            ...donationListings
                .map(
                  (listing) => ListingCard(
                listing: listing,
                onMessage: () {
                  // Navigate to chat screen
                },
              ),
            )
        ],
      ),
    );
  }
}