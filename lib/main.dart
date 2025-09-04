import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'startup_screen.dart'; // 🚀 UPDATE: App now starts at the startup screen.

void main() {
  runApp(const EWasteApp());
}

class EWasteApp extends StatelessWidget {
  const EWasteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Waste Marketplace',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.montserratTextTheme(
          ThemeData.dark().textTheme,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      home: const StartupScreen(), // 🚀 UPDATE: Initial route changed.
    );
  }
}