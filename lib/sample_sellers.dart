import 'seller.dart';
import 'sample_data.dart'; // We use listings from sample_data

final List<Seller> sampleSellers = [
  Seller(
    id: 's1',
    name: 'GadgetGuru',
    avatarUrl: 'https://i.pravatar.cc/150?img=11',
    rating: 4.9,
    ratingCount: 124,
    listings: [topSellingItems[0], topRatedItems[1]],
  ),
  Seller(
    id: 's2',
    name: 'TechReviver',
    avatarUrl: 'https://i.pravatar.cc/150?img=22',
    rating: 4.8,
    ratingCount: 89,
    listings: [recentItems[0], topRatedItems[0]],
  ),
  Seller(
    id: 's3',
    name: 'CircuitSurplus',
    avatarUrl: 'https://i.pravatar.cc/150?img=33',
    rating: 4.7,
    ratingCount: 201,
    listings: [topSellingItems[1], recentItems[1]],
  ),
];