import 'package:flutter/material.dart';
import 'listing.dart';
import 'listing_service.dart';
import 'chat_screen.dart';
import 'rating_stars.dart';


class ListingCard extends StatelessWidget {
  final Listing listing;
  final VoidCallback? onMessage; // optional override


  const ListingCard({super.key, required this.listing, this.onMessage});


  @override
  Widget build(BuildContext context) {
    final soldBadge = listing.sold
        ? Positioned(
      top: 10,
      right: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 6)]),
        child: const Text('SOLD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    )
        : const SizedBox.shrink();

    return Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Stack(children: [
        ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
    child: Image.network(listing.imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 150, color: Colors.grey[800], child: const Center(child: Icon(Icons.image, size: 40, color: Colors.grey)))),
    ),
    if (listing.donation)
      Positioned(
        top: 10,
        left: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(color: Colors.green.withOpacity(0.95), borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 6)]),
          child: const Text('Donation', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
         ),
      soldBadge,
    ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(listing.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Row(children: [
                RatingStars(rating: listing.rating, size: 16),
                const SizedBox(width: 8),
                Text('(${listing.ratingCount})', style: const TextStyle(color: Colors.white54)),
                const Spacer(),
                if (!listing.donation) Text('₱${listing.price?.toStringAsFixed(0)}', style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 8),
              Text(listing.description, maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onMessage ?? () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(seller: listing.seller))),
                    icon: const Icon(Icons.chat_bubble_outline),
                    label: const Text('Message'),
                    style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: listing.sold
                      ? null
                      : () async {
// choose transaction type
                    final type = await showDialog<String>(
                      context: context,
                      builder: (ctx) => SimpleDialog(
                        title: const Text('Choose transaction type'),
                        children: [
                          SimpleDialogOption(onPressed: () => Navigator.pop(ctx, 'F2F'), child: const Text('Face-to-Face')),
                          SimpleDialogOption(onPressed: () => Navigator.pop(ctx, 'Online'), child: const Text('Online Payment')),
                        ],
                      ),
                    );
                    if (type != null) {
                      ListingService.instance.reserve(listing.id, type);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Reserved as $type')));
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: Text(listing.sold ? 'Sold' : 'Reserve'),
                )
              ])
            ]),
          )
            ],
        ),
    );
  }
}