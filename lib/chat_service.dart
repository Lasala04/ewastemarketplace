import 'chat.dart';

class ChatService {
  ChatService._privateConstructor();
  static final ChatService instance = ChatService._privateConstructor();

  // conversations keyed by other user's name (for demo simplicity)
  final Map<String, List<Message>> _conversations = {};

  List<String> get conversations => _conversations.keys.toList();

  List<Message> messagesFor(String user) {
    return _conversations[user] ??= <Message>[];
  }

  void sendMessage(String user, Message message) {
    final conv = _conversations[user] ??= <Message>[];
    conv.add(message);
  }
}