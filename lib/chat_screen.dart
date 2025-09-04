// chat_screen.dart
import 'package:flutter/material.dart';
import 'chat_service.dart';
import 'chat.dart'; // adjust path to where your Message class is
import 'message_bubble.dart';

class ChatScreen extends StatefulWidget {
  final String seller;
  const ChatScreen({super.key, required this.seller});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  late List<Message> _messages;

  @override
  void initState() {
    super.initState();
    // load existing messages for this conversation
    _messages = ChatService.instance.messagesFor(widget.seller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final msg =
    Message(sender: "Me", text: text, time: DateTime.now(), isMe: true);

    ChatService.instance.sendMessage(widget.seller, msg);

    setState(() {
      _messages = ChatService.instance.messagesFor(widget.seller);
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Hero(
              tag: 'avatar-${widget.seller}',
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?u=${widget.seller}",
                ),
                radius: 18,
              ),
            ),
            const SizedBox(width: 12),
            Text(widget.seller,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, i) {
                final msg = _messages[i];
                final isMe = msg.isMe == true || msg.sender == "Me";
                return MessageBubble(
                    text: msg.text, time: msg.time, isMe: isMe);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: Colors.grey[900],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: _send,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}