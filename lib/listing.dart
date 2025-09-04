class Listing {
  String id;
  String title;
  String category;
  String imageUrl;
  String description;
  bool donation;
  String seller;
  double? price;
  double rating;
  int ratingCount;
  String? transactionType; // 'F2F' or 'Online'
  bool isSold; // 🚀 UPDATE: Changed from sold to isSold for consistency

  Listing({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.donation,
    required this.seller,
    this.price,
    this.rating = 0.0,
    this.ratingCount = 0,
    this.transactionType,
    this.isSold = false,
  });
}