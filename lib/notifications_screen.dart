import 'package:flutter/material.dart';
import 'notification.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.separated(
        itemCount: sampleNotifications.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final notification = sampleNotifications[index];
          return ListTile(
            leading: Icon(notification.icon, color: Colors.green),
            title: Text(notification.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(notification.subtitle),
            trailing: Text(notification.timeAgo, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            onTap: () {},
          );
        },
      ),
    );
  }
}