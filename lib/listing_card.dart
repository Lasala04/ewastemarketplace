// FILE: listing_card.dart (Corrected)

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'listing.dart';
import 'listing_detail_screen.dart';
import 'page_transition.dart';

class ListingCard extends StatelessWidget {
  final Listing listing;
  const ListingCard({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, FadeSlidePageRoute(page: ListingDetailScreen(listing: listing))),
      child: Card(
        clipBehavior: Clip.antiAlias,
        // ✅ FIX: Corrected the typo from 'RoundedRectangle-border' to 'RoundedRectangleBorder'
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: CachedNetworkImage(
                imageUrl: listing.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(color: Colors.grey[850]),
                ),
                errorWidget: (context, url, error) => const Center(child: Icon(Icons.broken_image, color: Colors.grey)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(listing.title, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                    Text("\u20B1${listing.price?.toStringAsFixed(0) ?? ''}", style: TextStyle(color: Colors.grey[300])),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}