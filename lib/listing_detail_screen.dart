import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'listing.dart';
import 'rate_transaction_sheet.dart';

class ListingDetailScreen extends StatefulWidget {
  final Listing listing;
  const ListingDetailScreen({super.key, required this.listing});

  @override
  State<ListingDetailScreen> createState() => _ListingDetailScreenState();
}

class _ListingDetailScreenState extends State<ListingDetailScreen> {
  late bool _isSold;

  @override
  void initState() {
    super.initState();
    _isSold = widget.listing.isSold;
  }

  void _markAsSold() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Transaction'),
        content: const Text('Are you sure you want to mark this item as sold?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isSold = true;
              });
              Navigator.of(ctx).pop();
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  void _showRatingSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) => const RateTransactionSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'listing-image-${widget.listing.id}',
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.listing.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    if (_isSold)
                      Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text('SOLD', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(widget.listing.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(widget.listing.description, style: const TextStyle(color: Colors.white70, height: 1.5)),
                const SizedBox(height: 20),
                if (!widget.listing.donation)
                  Text("₱${widget.listing.price?.toStringAsFixed(2)}", style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                // 🚀 UPDATE: Transactional and Rating buttons
                if (!_isSold)
                  ElevatedButton.icon(
                    onPressed: _markAsSold,
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text('Mark as Sold'),
                  )
                else
                  OutlinedButton.icon(
                    onPressed: _showRatingSheet,
                    icon: const Icon(Icons.star_outline),
                    label: const Text('Rate Seller'),
                  ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}