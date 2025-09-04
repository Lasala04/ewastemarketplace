import 'package:flutter/material.dart';
import 'listing_service.dart';
import 'listing_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key}); // ✅ added key

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ListingService _service = ListingService.instance;

  @override
  void initState() {
    super.initState();
    _service.addListener(_onServiceChanged);
  }

  @override
  void dispose() {
    _service.removeListener(_onServiceChanged);
    super.dispose();
  }

  void _onServiceChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final myListings = _service.all.where((l) => l.seller == 'Me').toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Row(children: [
            const CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12"),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("John Doe",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                Text("Eco Warrior", style: TextStyle(color: Colors.white54)),
              ],
            )
          ]),
          const SizedBox(height: 20),
          const Text("My Listings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...myListings.map(
                (l) => Dismissible(
              key: ValueKey(l.id),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              direction: DismissDirection.startToEnd,
              onDismissed: (_) => _service.delete(l.id),
              child: ListingCard(listing: l),
            ),
          ),
        ],
      ),
    );
  }
}