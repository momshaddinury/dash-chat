import 'package:dash_chat_app/features/chat/chat_model.dart';
import 'package:dash_chat_app/styles/k_colors.dart';
import 'package:dash_chat_app/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class ChatRow extends StatelessWidget {
  final ChatModel chat;
  final borderRadius = 8.0;

  const ChatRow({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMe = chat.sender == 'my@email.com';

    return Column(
      crossAxisAlignment:
      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.10),
                    spreadRadius: 0,
                    blurRadius: 20,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                color: isMe
                    ? KColors.chatSelfBubbleColor
                    : KColors.chatOthersBubbleColor,
              ),
              child: Text(
                chat.message,
                style: KTextStyle.subtitle1,
                textAlign: isMe
                    ? TextAlign.right
                    : TextAlign.left,
              ),
            ),
          ),
        ),
        if(!isMe)
          Text(chat.sender, style: KTextStyle.subtitle2.copyWith(color: Colors.grey.shade700),),
        const SizedBox(height: 5.0,)
      ],
    );
  }
}