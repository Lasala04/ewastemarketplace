import 'listing.dart';

List<Listing> sampleListings = [
  Listing(id: "1", title: "Used Laptop", category: "PCs", imageUrl: "https://images.unsplash.com/photo-1541807084-5c52b6b3adef?q=80&w=1974&auto=format&fit=crop", description: "Still working fine, just upgraded.", seller: "John", price: 5000),
  Listing(id: "2", title: "Old Smartphone", category: "Phones", imageUrl: "https://images.unsplash.com/photo-1598327105666-5b89351aff97?q=80&w=627&auto=format&fit=crop", description: "Good for backup use. Slight screen scratch.", seller: "Maria", price: 2500),
  Listing(id: 'l3', title: 'Microwave Oven', category: 'Appliances', imageUrl: 'https://images.unsplash.com/photo-1586201375754-1421e0aa2cd6?q=80&w=800&auto=format&fit=crop', description: 'Timer knob loose but works.', seller: 'Alex', price: 1200, rating: 3.8, ratingCount: 3, isSold: true),
];