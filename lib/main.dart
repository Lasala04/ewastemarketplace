import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // 🚀 UPDATE: Imported Google Fonts for better typography.
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.transparent, // 🚀 UPDATE: Made scaffold transparent for gradient.
        // 🚀 UPDATE: Integrated Google Fonts for a modern, clean look similar to Spotify.
        textTheme: GoogleFonts.montserratTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      home: Scaffold(
        // 🚀 UPDATE: Added a container with a subtle gradient for a more premium background.
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey[900]!, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.4],
            ),
          ),
          child: _screens[_selectedIndex],
        ),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.volunteer_activism), label: 'Donations'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Messages'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}