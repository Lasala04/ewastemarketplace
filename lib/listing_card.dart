import 'package:flutter/material.dart';
// 🚀 UPDATE: Imported packages for image caching and shimmer effect.
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'listing.dart';
import 'listing_detail_screen.dart';
import 'page_transition.dart';

class ListingCard extends StatelessWidget {
  final Listing listing;
  final VoidCallback? onMessage;
  const ListingCard({super.key, required this.listing, this.onMessage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          FadeSlidePageRoute(page: ListingDetailScreen(listing: listing)),
        );
      },
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'listing-image-${listing.id}',
              child: ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
                // 🚀 UPDATE: Replaced Image.network with CachedNetworkImage for performance.
                // Added a shimmer placeholder for a better loading experience.
                child: CachedNetworkImage(
                  imageUrl: listing.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                        height: 150, color: Colors.grey[850]),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 150,
                    color: Colors.grey[800],
                    child: const Center(
                      child: Icon(Icons.image_not_supported_rounded,
                          size: 40, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listing.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(
                    listing.donation
                        ? "Donation"
                        : "₱${listing.price?.toStringAsFixed(2) ?? ''}",
                    style: TextStyle(
                      color: listing.donation ? Colors.green : Colors.white70,
                    ),
                  ),
                  if (onMessage != null)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: onMessage,
                        icon: const Icon(Icons.chat_bubble_outline,
                            color: Colors.green),
                        label: const Text("Message",
                            style: TextStyle(color: Colors.green)),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}