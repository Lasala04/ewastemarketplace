// FILE: seller_card.dart (Corrected)

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'seller.dart';
import 'rating_stars.dart';

class SellerCard extends StatelessWidget {
  final Seller seller;
  final VoidCallback? onTap;

  const SellerCard({super.key, required this.seller, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16, right: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[800],
                backgroundImage: CachedNetworkImageProvider(seller.avatarUrl),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      seller.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        RatingStars(rating: seller.rating, size: 16),
                        const SizedBox(width: 8),
                        // ✅ FIX: Wrapped the review count in a Flexible widget to prevent overflow.
                        Flexible(
                          child: Text(
                            "(${seller.ratingCount} reviews)",
                            style: TextStyle(color: Colors.grey[400], fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (onTap != null)
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                ),
            ],
          ),
        ),
      ),
    );
  }
}