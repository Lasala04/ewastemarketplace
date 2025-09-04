import 'package:flutter/material.dart';
import 'listing.dart';
import 'chat_screen.dart';


class ListingCard extends StatelessWidget {
  final Listing listing;
  final VoidCallback onMessage;


  const ListingCard({super.key, required this.listing, required this.onMessage});


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(listing.imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height:150,color:Colors.grey[800],child:Center(child:Icon(Icons.image,size:40,color:Colors.grey)))),
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
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(listing.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                if (listing.donation)
                  const Text('Free - Donation', style: TextStyle(color: Colors.greenAccent))
                else
                  Text('₱${listing.price?.toStringAsFixed(2)}', style: const TextStyle(color: Colors.greenAccent)),
                const SizedBox(height: 8),
                Text(listing.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onMessage,
                        icon: const Icon(Icons.chat_bubble_outline),
                        label: const Text('Message'),
                        style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: BorderSide(color: Colors.white12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      child: const Text('Reserve'),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}