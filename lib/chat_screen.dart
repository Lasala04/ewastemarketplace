import 'package:flutter/material.dart';
import 'chat.dart';
import 'chat_service.dart';
import 'message_bubble.dart';

class ChatScreen extends StatefulWidget {
  final String seller;
  const ChatScreen({super.key, required this.seller});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  late List<Message> _messages;

  @override
  void initState() {
    super.initState();
    _messages = ChatService.instance.messagesFor(widget.seller);
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    final msg = Message(sender: 'Me', text: text, time: DateTime.now(), isMe: true);
    ChatService.instance.sendMessage(widget.seller, msg);
    setState(() {
      _messages = ChatService.instance.messagesFor(widget.seller);
    });
    _controller.clear();
    // animate insert
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _listKey.currentState?.insertItem(_messages.length - 1, duration: const Duration(milliseconds: 350));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(children: [CircleAvatar(backgroundColor: Colors.grey[800], child: Text(widget.seller.isNotEmpty ? widget.seller[0] : '?')), const SizedBox(width: 8), Text(widget.seller)])),
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _messages.length,
              reverse: false,
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemBuilder: (context, index, animation) {
                final message = _messages[index];
                return SizeTransition(
                  sizeFactor: animation,
                  child: Align(
                    alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: MessageBubble(text: message.text, time: message.time, isMe: message.isMe),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[900],
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.grey[850],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton.small(
                  onPressed: _sendMessage,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.send, color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}