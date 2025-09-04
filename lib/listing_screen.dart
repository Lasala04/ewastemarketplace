// add_listing_screen.dart
import 'package:flutter/material.dart';
import 'listing.dart';
import 'listing_service.dart';
import 'dart:math';

class AddListingScreen extends StatefulWidget {
  const AddListingScreen({super.key});

  @override
  State<AddListingScreen> createState() => _AddListingScreenState();
}

class _AddListingScreenState extends State<AddListingScreen> {
  final _form = GlobalKey<FormState>();
  String title = '';
  String category = 'Phones';
  String imageUrl = '';
  String description = '';
  bool donation = false;
  String seller = 'Me';
  String priceText = '';

  String _generateId() {
    final rand = Random();
    return DateTime.now().millisecondsSinceEpoch.toString() +
        rand.nextInt(9999).toString();
  }

  void _submit() {
    if (!_form.currentState!.validate()) return;
    _form.currentState!.save();

    final id = _generateId();

    final l = Listing(
      id: id,
      title: title,
      category: category,
      imageUrl: imageUrl.isEmpty ? 'https://via.placeholder.com/400' : imageUrl,
      description: description,
      donation: donation,
      seller: seller,
      price: donation ? null : double.tryParse(priceText) ?? 0.0,
      rating: 0.0,
      ratingCount: 0,
      sold: false,
    );

    ListingService.instance.add(l);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Listing')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _form,
          child: ListView(children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              onSaved: (v) => title = v!.trim(),
              validator: (v) =>
              v == null || v.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: category,
              items: const [
                DropdownMenuItem(value: 'Phones', child: Text('Phones')),
                DropdownMenuItem(value: 'PCs', child: Text('PCs')),
                DropdownMenuItem(
                    value: 'Appliances', child: Text('Appliances')),
              ],
              onChanged: (v) => setState(() => category = v ?? category),
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Image URL'),
              onSaved: (v) => imageUrl = v!.trim(),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 4,
              onSaved: (v) => description = v!.trim(),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text('Donation (Free)'),
              value: donation,
              onChanged: (v) => setState(() => donation = v),
            ),
            if (!donation)
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price (₱)'),
                keyboardType: TextInputType.number,
                onSaved: (v) => priceText = v ?? '',
              ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Publish'),
            ),
          ]),
        ),
      ),
    );
  }
}