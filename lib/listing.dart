class Listing {
  final String title;
  final String category;
  final String imageUrl;
  final String description;
  final bool donation; // existing field
  final String seller;
  final double? price;

  Listing({
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.donation,
    required this.seller,
    this.price,
  });

  bool get isDonation => donation;
}
