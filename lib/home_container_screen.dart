import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'impact_screen.dart';
import 'messages_screen.dart'; // 🚀 UPDATE: Messages screen is back
import 'profile_screen.dart';
import 'add_listing_screen.dart';
import 'page_transition.dart';

class HomeContainerScreen extends StatefulWidget {
  const HomeContainerScreen({super.key});
  @override
  HomeContainerScreenState createState() => HomeContainerScreenState();
}

class HomeContainerScreenState extends State<HomeContainerScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const MessagesScreen(), // 🚀 UPDATE: Replaced Sellers with Messages
    const ImpactScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(FadeSlidePageRoute(page: const AddListingScreen())),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.black.withOpacity(0.8),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavItem(Icons.home_outlined, 'Home', 0),
              _buildNavItem(Icons.chat_bubble_outline, 'Messages', 1), // 🚀 UPDATE
              const SizedBox(width: 40),
              _buildNavItem(Icons.volunteer_activism_outlined, 'Impact', 2),
              _buildNavItem(Icons.person_outline, 'Profile', 3), // Index adjusted
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index),
        borderRadius: BorderRadius.circular(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.green : Colors.grey, size: 26),
            Text(label, style: TextStyle(color: isSelected ? Colors.green : Colors.grey, fontSize: 12, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}