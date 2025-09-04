// seed_data.dart

import 'listing.dart';

final seedListings = [
  Listing(
    id: 'l1',
    title: 'iPhone X (64GB)',
    category: 'Phones',
    imageUrl:
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=800&auto=format&fit=crop',
    description: 'Still works great. Battery 82%. With case.',
    seller: 'Alice',
    price: 6500,
    rating: 4.2,
    ratingCount: 5,
  ),
  // ✅ FIX: Removed the second listing which was for donation and had a null price.
  Listing(
    id: 'l3',
    title: 'Microwave Oven',
    category: 'Appliances',
    imageUrl:
    'https://images.unsplash.com/photo-1664823841949-a2f18f3809e7?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Dhttps://images.unsplash.com/photo-1664823841949-a2f18f3809e7?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    description: 'Timer knob loose but works.',
    seller: 'Bob',
    price: 1200,
    rating: 3.8,
    ratingCount: 3,
  ),
];