// donations_screen.dart
import 'package:flutter/material.dart';
import 'sample_data.dart';
import 'listing_card.dart';
import 'page_transition.dart';
import 'chat_screen.dart'; // keep this because we use ChatScreen below

class DonationsScreen extends StatelessWidget {
  const DonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final donationListings =
    sampleListings.where((l) => l.donation).toList();

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
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "No donation items available right now.",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            )
          else
            ...donationListings.map(
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
            ),
        ],
      ),
    );
  }
}