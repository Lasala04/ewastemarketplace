import 'package:flutter/material.dart';
import 'package:animated_gradient/animated_gradient.dart';

class AnimatedGradientBackground extends StatelessWidget {
  final Widget child;
  const AnimatedGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedGradient(
      // 🚀 UPDATE: Green and gray color scheme
      colors: const [Color(0xff1E3A3A), Color(0xff111818), Color(0xff0d0d0d)],
      child: child,
    );
  }
}