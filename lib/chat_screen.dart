import 'package:flutter/material.dart';
import 'chat_service.dart';
import 'chat.dart';
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
  bool _isComposing = false; // 🚀 UPDATE: State to track if user is typing.

  @override
  void initState() {
    super.initState();
    _messages = ChatService.instance.messagesFor(widget.seller);
    // 🚀 UPDATE: Listener to animate send button visibility.
    _controller.addListener(() {
      final isCurrentlyComposing = _controller.text.isNotEmpty;
      if (isCurrentlyComposing != _isComposing) {
        setState(() {
          _isComposing = isCurrentlyComposing;
        });
      }
    });
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
              reverse: true, // Show latest messages at the bottom
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, i) {
                final reversedIndex = _messages.length - 1 - i;
                final msg = _messages[reversedIndex];
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
                // 🚀 UPDATE: AnimatedSwitcher for a nice micro-interaction on the send button.
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: _isComposing
                      ? IconButton(
                    key: const ValueKey('send_button'),
                    icon: const Icon(Icons.send, color: Colors.green),
                    onPressed: _send,
                  )
                      : const SizedBox.shrink(key: ValueKey('empty_box')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}