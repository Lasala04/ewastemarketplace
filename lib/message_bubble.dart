import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final DateTime time;
  final bool isMe;

  const MessageBubble({super.key, required this.text, required this.time, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isMe ? Colors.green : Colors.grey[800];
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = isMe
        ? const BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
      bottomLeft: Radius.circular(16),
    )
        : const BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
      bottomRight: Radius.circular(16),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Column(
        crossAxisAlignment: align,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutQuint,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: BoxDecoration(color: bubbleColor, borderRadius: radius, boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 6, offset: const Offset(0,2))
            ]),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 260),
              child: Text(
                text,
                style: TextStyle(color: isMe ? Colors.black : Colors.white, fontSize: 15),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            _formatTime(time),
            style: TextStyle(color: Colors.white54, fontSize: 11),
          )
        ],
      ),
    );
  }

  String _formatTime(DateTime t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}