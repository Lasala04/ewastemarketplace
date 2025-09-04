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
    title: 'Smart TV',
    category: 'Appliances',
    imageUrl:
    'https://images.unsplash.com/photo-1461151304267-38535e780c79?q=80&w=1933&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    description: 'In perfect condition. No flaws.',
    seller: 'Bob',
    price: 12200,
    rating: 3.8,
    ratingCount: 3,
  ),
];