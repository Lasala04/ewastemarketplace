import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'donations_screen.dart';
import 'messages_screen.dart';
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
    const SearchScreen(),
    const DonationsScreen(),
    const MessagesScreen(),
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey[900]!, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.4],
          ),
        ),
        child: IndexedStack( // Use IndexedStack to preserve state of each screen
          index: _selectedIndex,
          children: _screens,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(FadeSlidePageRoute(page: const AddListingScreen()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.black,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildNavItem(Icons.home, 'Home', 0),
              _buildNavItem(Icons.search, 'Search', 1),
              const SizedBox(width: 40), // The space for the FAB
              _buildNavItem(Icons.volunteer_activism, 'Donations', 2),
              _buildNavItem(Icons.person, 'Profile', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _onItemTapped(index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: _selectedIndex == index ? Colors.green : Colors.grey),
              Text(label, style: TextStyle(color: _selectedIndex == index ? Colors.green : Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}