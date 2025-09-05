// profile_screen.dart

import 'package:flutter/material.dart';
import 'dashboard_stat_card.dart';
import 'edit_profile_screen.dart';
import 'user_listings_view.dart';
import 'page_transition.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12"),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("John Doe", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text("Eco Warrior", style: TextStyle(color: Colors.grey[400], fontSize: 16)),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () => Navigator.of(context).push(FadeSlidePageRoute(page: const EditProfileScreen())),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey[700]!),
                ),
                child: const Text("Edit"),
              )
            ],
          ),
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),
          const Text("Seller Dashboard", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          // ✅ FIX: Removed the 'const' keyword from the GridView.
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
            ),
            children: const [
              DashboardStatCard(title: 'Active Listings', value: '5', icon: Icons.list_alt),
              DashboardStatCard(title: 'Seller Rating', value: '4.8 ★', icon: Icons.star_border),
              DashboardStatCard(title: 'Total Payout', value: '₱8,550', icon: Icons.account_balance_wallet_outlined),
              DashboardStatCard(title: 'Listing Clicks', value: '1,421', icon: Icons.ads_click),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          // User Listings Section
          const UserListingsView(),
        ],
      ),
    );
  }
}