// messages_screen.dart
import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'page_transition.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  final List<Map<String, String>> dummyConversations = const [
    {
      "name": "John",
      "avatar": "https://i.pravatar.cc/150?img=11",
      "last": "Still available?",
    },
    {
      "name": "Maria",
      "avatar": "https://i.pravatar.cc/150?img=22",
      "last": "Can I donate this?",
    },
    {
      "name": "Alex",
      "avatar": "https://i.pravatar.cc/150?img=33",
      "last": "When can we meet?",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Messages")),
      body: ListView.builder(
        itemCount: dummyConversations.length,
        itemBuilder: (context, i) {
          final convo = dummyConversations[i];
          return ListTile(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Hero(
              tag: 'avatar-${convo["name"]}',
              child: CircleAvatar(
                backgroundImage: NetworkImage(convo["avatar"]!),
                radius: 26,
              ),
            ),
            title: Text(convo["name"]!,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(convo["last"]!,
                style: const TextStyle(color: Colors.white70)),
            onTap: () {
              Navigator.push(
                context,
                FadeSlidePageRoute(
                  page: ChatScreen(seller: convo["name"]!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}