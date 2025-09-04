import 'package:flutter/material.dart';
import 'impact_tracker_card.dart';
import 'school_list_screen.dart';
import 'page_transition.dart';

class ImpactScreen extends StatelessWidget {
  const ImpactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("Your Impact"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const ImpactTrackerCard(),
          const SizedBox(height: 24),
          Text(
            '"Every item you buy, sell, or donate prevents e-waste from entering landfills."',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 32),
          const Divider(color: Colors.grey),
          const SizedBox(height: 24),
          _buildDonationSection(context),
        ],
      ),
    );
  }

  Widget _buildDonationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Donate Your E-Waste",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          "Help schools in need by donating your unused electronics directly to them.",
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 16),
        Card(
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            leading: const Icon(Icons.school_outlined, color: Colors.green, size: 30),
            title: const Text("View Schools in Need", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("Connect with local institutions"),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              Navigator.of(context).push(FadeSlidePageRoute(page: const SchoolListScreen()));
            },
          ),
        ),
      ],
    );
  }
}