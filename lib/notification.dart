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

// Dummy data for notifications
final List<NotificationItem> sampleNotifications = [
  NotificationItem(
    title: 'New Message from "Alice"',
    subtitle: 'Regarding your iPhone X listing: "Is this still available?"',
    timeAgo: '5m ago',
    icon: Icons.chat_bubble_outline,
  ),
  NotificationItem(
    title: 'Your Listing is Popular!',
    subtitle: '"Used Laptop" has received 100 views this week.',
    timeAgo: '1h ago',
    icon: Icons.visibility_outlined,
  ),
  NotificationItem(
    title: 'Transaction Completed',
    subtitle: 'Your sale of "Microwave Oven" has been marked as complete.',
    timeAgo: '1d ago',
    icon: Icons.check_circle_outline,
  ),
];