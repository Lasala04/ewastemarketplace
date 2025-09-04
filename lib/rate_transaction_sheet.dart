import 'package:flutter/material.dart';
import 'rating_stars.dart';

class RateTransactionSheet extends StatelessWidget {
  const RateTransactionSheet({super.key});

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
          const Center(child: RatingStars(rating: 0, size: 40)), // This could be made stateful
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
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Submit Rating'),
          ),
        ],
      ),
    );
  }
}