import 'dart:async';

import 'package:dash_chat_app/features/chat/chat_model.dart';
import 'package:dash_chat_app/features/chat/chat_repository.dart';

class ChatViewModel {
  final IChatRepository _repo = MockChatRepository();

  Stream<List<ChatModel>> get messages => _repo.getMessages();


}