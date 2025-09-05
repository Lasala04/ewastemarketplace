import 'listing.dart';

class Seller {
  final String id;
  final String name;
  final String avatarUrl;
  final double rating;
  final int ratingCount;
  final List<Listing> listings;

  Seller({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.rating,
    required this.ratingCount,
    required this.listings,
  });
}