import 'listing.dart';


final seedListings = [
  Listing(
    id: 'l1',
    title: 'iPhone X (64GB)',
    category: 'Phones',
    imageUrl: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=800&auto=format&fit=crop',
    description: 'Still works great. Battery 82%. With case.',
    donation: false,
    seller: 'Alice',
    price: 6500,
    rating: 4.2,
    ratingCount: 5,
  ),
  Listing(
    id: 'l2',
    title: 'Old desktop PC (for donation)',
    category: 'PCs',
    imageUrl: 'https://images.unsplash.com/photo-1518779578993-ec3579fee39f?q=80&w=800&auto=format&fit=crop',
    description: 'i5 4th gen, 8GB RAM. Good for basic labs. Donating to schools.',
    donation: true,
    seller: 'Green NGO',
    price: null,
    rating: 4.6,
    ratingCount: 8,
  ),
  Listing(
    id: 'l3',
    title: 'Microwave Oven',
    category: 'Appliances',
    imageUrl: 'https://images.unsplash.com/photo-1586201375754-1421e0aa2cd6?q=80&w=800&auto=format&fit=crop',
    description: 'Timer knob loose but works.',
    donation: false,
    seller: 'Bob',
    price: 1200,
    rating: 3.8,
    ratingCount: 3,
  ),
];