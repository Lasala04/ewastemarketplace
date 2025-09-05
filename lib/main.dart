import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'startup_screen.dart';
import 'animated_gradient_background.dart';

void main() {
  runApp(const EcoByteApp());
}

class EcoByteApp extends StatelessWidget {
  const EcoByteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoByte',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green, // 🚀 UPDATE: Color scheme reverted
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // 🚀 UPDATE: Color scheme reverted
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      builder: (context, child) {
        return AnimatedGradientBackground(child: child!);
      },
      home: const StartupScreen(),
    );
  }
}