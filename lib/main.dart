// main.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'donations_screen.dart';
import 'messages_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(const EWasteApp());
}

class EWasteApp extends StatefulWidget {
  const EWasteApp({super.key});

  @override
  EWasteAppState createState() => EWasteAppState();
}

class EWasteAppState extends State<EWasteApp> {
  int _selectedIndex = 0;

  // ✅ Removed const list, avoids the "const constructor" error
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    DonationsScreen(),
    MessagesScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white54,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.volunteer_activism), label: 'Donations'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Messages'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}