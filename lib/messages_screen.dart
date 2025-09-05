import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'chat_screen.dart';
import 'page_transition.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});
  final List<Map<String, String>> dummyConversations = const [
    {"name": "GadgetGuru", "avatar": "https://i.pravatar.cc/150?img=11", "last": "Sounds good, see you then!"},
    {"name": "TechReviver", "avatar": "https://i.pravatar.cc/150?img=22", "last": "Is the item still available?"},
    {"name": "CircuitSurplus", "avatar": "https://i.pravatar.cc/150?img=33", "last": "Thanks for the great deal!"},
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(convo["avatar"]!),
              radius: 28,
            ),
            title: Text(convo["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(convo["last"]!, style: const TextStyle(color: Colors.white70)),
            onTap: () {
              Navigator.push(context, FadeSlidePageRoute(page: ChatScreen(seller: convo["name"]!)));
            },
          );
        },
      ),
    );
  }
}