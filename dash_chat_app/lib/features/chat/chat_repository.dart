import 'package:dash_chat_app/features/chat/chat_model.dart';

abstract class IChatRepository {
  Stream<List<ChatModel>> getMessages();
}

class MockChatRepository implements IChatRepository{

  final List<ChatModel> messages = [
    ChatModel('3j4231jsx12343', 'my@email.com', 'How are you?'),
    ChatModel('3j4231jsx12343', 'someone@gmail.com', 'Amazing'),
    ChatModel('3j4231jsx12343', 'my@email.com', 'How are you?'),
    ChatModel('3j4231jsx12343', 'someone@gmail.com', 'Amazing'),
    ChatModel('3j4231jsx12343', 'my@email.com', 'How are you?'),
    ChatModel('3j4231jsx12343', 'someone@gmail.com', 'Amazing'),
    ChatModel('3j4231jsx12343', 'my@email.com', 'How are you?'),
    ChatModel('3j4231jsx12343', 'someone@gmail.com', 'Amazing'),
  ];

  @override
  Stream<List<ChatModel>> getMessages() async*{
    // await Future<void>.delayed(const Duration(seconds: 1));
    yield messages;
  }

}

