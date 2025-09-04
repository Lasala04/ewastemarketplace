// listing_detail_screen.dart
import 'package:flutter/material.dart';
import 'listing.dart';

class ListingDetailScreen extends StatelessWidget {
  final Listing listing;
  const ListingDetailScreen({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'listing-image-${listing.id}',
            child: Image.network(
              listing.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listing.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  listing.description,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 20),
                if (!listing.donation)
                  Text(
                    "₱${listing.price?.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}