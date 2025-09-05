import 'package:flutter/material.dart';
import 'listing.dart';
import 'listing_card.dart';

class HorizontalListingCarousel extends StatelessWidget {
  final String title;
  final List<Listing> listings;

  const HorizontalListingCarousel({
    super.key,
    required this.title,
    required this.listings,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: listings.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 180,
                child: ListingCard(listing: listings[index]),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}