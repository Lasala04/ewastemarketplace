// listing_service.dart

import 'package:flutter/foundation.dart';
import 'listing.dart';

class ListingService extends ChangeNotifier {
  ListingService._private();
  static final ListingService instance = ListingService._private();
  final List<Listing> _listings = [];

  List<Listing> get all => List.unmodifiable(_listings);

  void seed(List<Listing> items) {
    _listings.clear();
    _listings.addAll(items);
    notifyListeners();
  }

  void add(Listing l) {
    _listings.insert(0, l);
    notifyListeners();
  }

  void delete(String id) {
    _listings.removeWhere((l) => l.id == id);
    notifyListeners();
  }

  void rate(String id, double stars) {
    final l = _listings.firstWhere((x) => x.id == id);
    final total = l.rating * l.ratingCount;
    l.ratingCount += 1;
    l.rating = (total + stars) / l.ratingCount;
    notifyListeners();
  }

  void reserve(String id, String type) {
    final l = _listings.firstWhere((x) => x.id == id);
    l.transactionType = type;
    l.isSold = true; // ✅ FIX: Changed from sold to isSold
    notifyListeners();
  }

  List<Listing> filter(
      {String category = 'All',
        bool donationsOnly = false,
        int minStars = 0,
        String stock = 'available'}) {
    return _listings.where((l) {
      if (category != 'All' && l.category != category) return false;
      if (donationsOnly && !l.donation) return false;
      if (minStars > 0 && (l.rating.round() < minStars)) return false;
      if (stock == 'available' && l.isSold) return false; // ✅ FIX: Changed from sold to isSold
      if (stock == 'sold' && !l.isSold) return false;      // ✅ FIX: Changed from sold to isSold
      return true;
    }).toList();
  }
}