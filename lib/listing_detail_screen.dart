import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'listing.dart';
import 'rate_transaction_sheet.dart';
import 'chat_screen.dart'; // ✅ FIX: Import chat screen
import 'page_transition.dart'; // ✅ FIX: Import page transition

class ListingDetailScreen extends StatefulWidget {
  final Listing listing;
  const ListingDetailScreen({super.key, required this.listing});

  @override
  State<ListingDetailScreen> createState() => _ListingDetailScreenState();
}

class _ListingDetailScreenState extends State<ListingDetailScreen> {
  // ✅ FIX: State to track purchase for rating system
  bool _isPurchased = false;

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
                tag: 'listing-image-${widget.listing.id}',
                child: CachedNetworkImage(imageUrl: widget.listing.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(widget.listing.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("Sold by ${widget.listing.seller}", style: TextStyle(fontSize: 16, color: Colors.grey[400])),
                const SizedBox(height: 16),
                Text(widget.listing.description, style: const TextStyle(color: Colors.white70, height: 1.5)),
                const SizedBox(height: 20),
                // ✅ FIX: Using Unicode to ensure Peso sign loads
                Text("\u20B1${widget.listing.price?.toStringAsFixed(2)}", style: const TextStyle(fontSize: 22, color: Colors.green, fontWeight: FontWeight.bold)),
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
            // ✅ FIX: Button now navigates to a functional chat screen
            ElevatedButton.icon(
              icon: const Icon(Icons.chat_bubble_outline),
              label: const Text("Message Seller"),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
              onPressed: () {
                Navigator.of(context).push(FadeSlidePageRoute(page: ChatScreen(sellerName: widget.listing.seller)));
              },
            ),
            const SizedBox(height: 8),
            // ✅ FIX: Button to simulate purchase
            if (!_isPurchased)
              OutlinedButton(
                child: const Text("Simulate Purchase"),
                onPressed: () {
                  setState(() => _isPurchased = true);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Purchase complete! You can now rate this item.'), backgroundColor: Colors.blue),
                  );
                },
              ),
            // ✅ FIX: Rating button is now conditional
            if (_isPurchased)
              TextButton(
                child: const Text("Rate Item", style: TextStyle(color: Colors.green)),
                onPressed: () => _showRatingSheet(context),
              ),
          ],
        ),
      ),
    );
  }
}