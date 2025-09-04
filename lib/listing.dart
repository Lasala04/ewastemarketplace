class Listing {
  String id;
  String title;
  String category;
  String imageUrl;
  String description;
  String seller;
  double? price;
  double rating;
  int ratingCount;
  bool isSold;

  Listing({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.seller,
    this.price,
    this.rating = 0.0,
    this.ratingCount = 0,
    this.isSold = false,
  });
}