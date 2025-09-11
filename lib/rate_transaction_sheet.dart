import 'package:flutter/material.dart';
import 'rating_stars.dart';

class RateTransactionSheet extends StatefulWidget {
  const RateTransactionSheet({super.key});

  @override
  State<RateTransactionSheet> createState() => _RateTransactionSheetState();
}

class _RateTransactionSheetState extends State<RateTransactionSheet> {
  // ✅ FIX: Made stateful for interactive rating
  double _currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Rate this Transaction', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Center(
            child: RatingStars(
              rating: _currentRating,
              size: 40,
              onRate: (rating) => setState(() => _currentRating = rating),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Leave a review (optional)',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Submit Rating'),
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Thank you for your feedback!'), backgroundColor: Colors.green),
              );
            },
          ),
        ],
      ),
    );
  }
}