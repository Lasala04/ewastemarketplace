import 'package:flutter/material.dart';

class NotificationItem {
  final String title;
  final String subtitle;
  final String timeAgo;
  final IconData icon;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.timeAgo,
    required this.icon,
  });
}

// ✅ FIX: Updated with more diverse notifications
final List<NotificationItem> sampleNotifications = [
  NotificationItem(
    title: 'New Message from "GadgetGuru"',
    subtitle: 'Regarding your listing: "Is this still available?"',
    timeAgo: '5m ago',
    icon: Icons.chat_bubble_outline,
  ),
  NotificationItem(
    title: 'New Listing Alert!',
    subtitle: '"Vintage Speakers" was just listed in Appliances.',
    timeAgo: '30m ago',
    icon: Icons.new_releases_outlined,
  ),
  NotificationItem(
    title: 'Impact Update',
    subtitle: 'Together, we have now prevented over 21 KGS of e-waste!',
    timeAgo: '1h ago',
    icon: Icons.landscape_outlined,
  ),
  NotificationItem(
    title: 'Recommendation For You',
    subtitle: 'You might be interested in "Samsung S10".',
    timeAgo: '3h ago',
    icon: Icons.recommend_outlined,
  ),
  NotificationItem(
    title: 'Transaction Completed',
    subtitle: 'Your sale of "Microwave Oven" has been marked as complete.',
    timeAgo: '1d ago',
    icon: Icons.check_circle_outline,
  ),
];