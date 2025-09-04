import 'package:flutter/material.dart';
import 'chat.dart';
import 'chat_service.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  // For demo, conversations are keyed by seller name
  List<String> get _conversations => ChatService.instance.conversations;

  @override
  void initState() {
    super.initState();
    // seed a couple of demo messages if empty
    if (_conversations.isEmpty) {
      ChatService.instance.sendMessage('John', Message(sender: 'John', text: 'Is this still available?', time: DateTime.now().subtract(const Duration(minutes: 30))));
      ChatService.instance.sendMessage('Jane', Message(sender: 'Jane', text: 'Thanks for the donation!', time: DateTime.now().subtract(const Duration(hours: 3))));
    }
  }

  @override
  Widget build(BuildContext context) {
    final convos = ChatService.instance.conversations;
    return SafeArea(
      child: ListView.builder(
        itemCount: convos.length,
        itemBuilder: (context, index) {
          final name = convos[index];
          final msgs = ChatService.instance.messagesFor(name);
          final last = msgs.isNotEmpty ? msgs.last : null;
          return ListTile(
            leading: CircleAvatar(backgroundColor: Colors.grey[800], child: Text(name.isNotEmpty ? name[0] : '?')),
            title: Text(name),
            subtitle: Text(last?.text ?? 'Say hi'),
            trailing: Text(last != null ? _ago(last!.time) : ''),
            onTap: () async {
              await Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(seller: name)));
              setState(() {});
            },
          );
        },
      ),
    );
  }

  String _ago(DateTime t) {
    final diff = DateTime.now().difference(t);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    return '${diff.inDays}d';
  }
}