import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'school.dart';

class SchoolDetailScreen extends StatelessWidget {
  final School school;
  const SchoolDetailScreen({super.key, required this.school});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(school.name, style: const TextStyle(shadows: [Shadow(color: Colors.black, blurRadius: 8)])),
              background: CachedNetworkImage(
                imageUrl: school.imageUrl,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.3),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildDetailRow(Icons.location_on_outlined, "Address", school.address),
                _buildDetailRow(Icons.person_outline, "Contact Person", school.contactPerson),
                _buildDetailRow(Icons.devices_other_outlined, "Items Needed", school.neededItems),
                const SizedBox(height: 16),
                const Text("Our Mission", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(school.mission, style: const TextStyle(color: Colors.white70, height: 1.5)),
              ]),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.chat_bubble_outline),
          label: const Text("Message to Donate"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            // Mock action, shows a snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Opening chat with school representative...'), backgroundColor: Colors.green),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.green, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}