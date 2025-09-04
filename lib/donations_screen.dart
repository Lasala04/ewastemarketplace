import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'sample_data.dart';
import 'listing_card.dart';
import 'page_transition.dart';
import 'chat_screen.dart';

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
            Center(
              child: Padding(
                padding:
                const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.redeem_rounded,
                        size: 80, color: Colors.grey[700]),
                    const SizedBox(height: 20),
                    const Text(
                      "No Donations... Yet!",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Items available for donation will appear here. Check back soon!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
          else
            AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: donationListings
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
            ),
        ],
      ),
    );
  }
}