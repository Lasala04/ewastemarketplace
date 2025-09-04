import 'package:flutter/material.dart';
import 'sample_data.dart';
import 'listing_card.dart';
import 'chat_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String currentUser = 'John'; // demo current user

  @override
  Widget build(BuildContext context) {
    final myListings = sampleListings.where((l) => l.seller == currentUser).toList();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 8)]),
                child: Center(child: Text(currentUser[0], style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black))),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(currentUser, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Active listings: ${myListings.length}', style: const TextStyle(color: Colors.white70)),
                ]),
              ),
              ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.green), child: const Text('Edit'))
            ],
          ),
          const SizedBox(height: 20),
          const Text('Your listings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          if (myListings.isEmpty)
            const Padding(padding: EdgeInsets.all(20), child: Text('You have no listings yet.'))
          else
            ...myListings.map((l) => Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: ListingCard(listing: l, onMessage: () { Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(seller: l.seller))); }))),
          const SizedBox(height: 20),
          const Text('Account', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ListTile(leading: const Icon(Icons.settings), title: const Text('Settings'), onTap: () {}),
          ListTile(leading: const Icon(Icons.logout), title: const Text('Sign out'), onTap: () {}),
        ],
      ),
    );
  }
}