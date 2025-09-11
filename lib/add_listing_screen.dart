import 'package:flutter/material.dart';
import 'listing_service.dart';
import 'listing.dart';
import 'dart:math';

class AddListingScreen extends StatefulWidget {
  const AddListingScreen({super.key});
  @override
  State<AddListingScreen> createState() => _AddListingScreenState();
}

class _AddListingScreenState extends State<AddListingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  String _category = 'Phones';

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _submitListing() {
    if (_formKey.currentState!.validate()) {
      // ✅ FIX: Add new listing to the service
      final newListing = Listing(
        id: 'user_listing_${Random().nextInt(1000)}',
        title: _titleController.text,
        description: _descriptionController.text,
        price: double.tryParse(_priceController.text) ?? 0,
        category: _category,
        seller: 'John Doe', // Mock seller name
        imageUrl: 'https://images.unsplash.com/photo-1591337676887-a217a6970a8a?q=80&w=1780&auto=format&fit=crop', // Mock image
      );
      ListingService.instance.addListing(newListing);

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Listing created successfully!'), backgroundColor: Colors.green),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Listing')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (v) => v!.isEmpty ? 'Please enter a title' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 4,
              validator: (v) => v!.isEmpty ? 'Please enter a description' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price', prefixText: '\u20B1 '),
              keyboardType: TextInputType.number,
              validator: (v) => v!.isEmpty ? 'Please enter a price' : null,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _category,
              items: ['Phones', 'PCs', 'Appliances'].map((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value));
              }).toList(),
              onChanged: (newValue) => setState(() => _category = newValue!),
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text('Upload Images'),
              onPressed: () {},
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitListing,
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
              child: const Text('PUBLISH LISTING'),
            ),
          ],
        ),
      ),
    );
  }
}