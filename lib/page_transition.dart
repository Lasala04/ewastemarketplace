import 'package:flutter/material.dart';

class FadeSlidePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  FadeSlidePageRoute({required this.page})
      : super(
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) {
      final slide = Tween<Offset>(
        begin: const Offset(0.05, 0.1),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));
      final fade = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));
      return SlideTransition(position: slide, child: FadeTransition(opacity: fade, child: child));
    },
  );
}