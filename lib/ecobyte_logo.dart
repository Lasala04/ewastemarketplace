import 'package:flutter/material.dart';

class EcoByteLogo extends StatelessWidget {
  final double size;
  const EcoByteLogo({super.key, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.eco, color: Colors.green, size: size), // 🚀 UPDATE: Color
        const SizedBox(height: 8),
        const Text(
          "EcoByte",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}