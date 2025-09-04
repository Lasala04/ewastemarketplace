// profile_screen.dart

import 'package:flutter/material.dart';
import 'dashboard_stat_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const SizedBox(height: 20),
          // User Info
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12"),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("John Doe", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("Eco Warrior", style: TextStyle(color: Colors.white70, fontSize: 16)),
                ],
              )
            ],
          ),
          const SizedBox(height: 30),
          const Divider(color: Colors.grey),
          const SizedBox(height: 20),

          // Seller Dashboard Implementation
          const Text("Seller Dashboard", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 20),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
            ),
            children: const [ // ✅ FIX: Added 'const' back to each widget
              DashboardStatCard(title: 'Active Listings', value: '5', icon: Icons.list_alt),
              DashboardStatCard(title: 'Seller Rating', value: '4.8 ★', icon: Icons.star_border),
              DashboardStatCard(title: 'Total Payout', value: '₱8,550', icon: Icons.account_balance_wallet_outlined),
              DashboardStatCard(title: 'Listing Clicks', value: '1,421', icon: Icons.ads_click),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.grey),
          const SizedBox(height: 20),
          const Text("My Listings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 10),
          Center(child: Text("Your active listings will appear here.", style: TextStyle(color: Colors.grey[600]))),
        ],
      ),
    );
  }
}