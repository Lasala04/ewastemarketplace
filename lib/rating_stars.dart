import 'package:flutter/material.dart';


class RatingStars extends StatelessWidget {
  final double rating; // average
  final double size;
  final void Function(double)? onRate; // if provided, makes it interactive


  const RatingStars({super.key, required this.rating, this.size = 18, this.onRate});


  @override
  Widget build(BuildContext context) {
    int full = rating.floor();
    bool half = (rating - full) >= 0.5;


    Widget _star(int index) {
      IconData icon;
      final starValue = index + 1;
      if (starValue <= full) icon = Icons.star;
      else if (starValue == full + 1 && half) icon = Icons.star_half;
      else icon = Icons.star_border;


      return GestureDetector(
        onTap: () {
          if (onRate != null) onRate!(starValue.toDouble());
        },
        child: Icon(icon, size: size, color: Colors.amber),
      );
    }


    return Row(children: List.generate(5, (i) => _star(i)));
  }
}