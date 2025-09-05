// FILE: listing_detail_screen.dart (Corrected)

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'listing.dart';
import 'rate_transaction_sheet.dart';

class ListingDetailScreen extends StatelessWidget {
  final Listing listing;
  const ListingDetailScreen({super.key, required this.listing});

  void _showRatingSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const RateTransactionSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'listing-image-${listing.id}',
                child: CachedNetworkImage(
                  imageUrl: listing.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(color: Colors.grey[800]),
                  errorWidget: (context, url, error) => const Center(child: Icon(Icons.broken_image)),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  listing.title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  "Sold by ${listing.seller}",
                  style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                ),
                const SizedBox(height: 16),
                Text(
                  listing.description,
                  style: const TextStyle(color: Colors.white70, height: 1.5),
                ),
                const SizedBox(height: 20),
                // ✅ FIX: Replaced '₱' with its Unicode escape sequence '\u20B1'
                Text(
                  "\u20B1${listing.price?.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.chat_bubble_outline),
              label: const Text("Message Seller"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Opening chat with ${listing.seller}...'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            TextButton(
              child: const Text(
                "Rate Item (after purchase)",
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () => _showRatingSheet(context),
            ),
          ],
        ),
      ),
    );
  }
}