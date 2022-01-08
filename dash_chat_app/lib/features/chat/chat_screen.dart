import 'package:dash_chat_app/features/chat/chat_model.dart';
import 'package:dash_chat_app/features/chat/chat_view_model.dart';
import 'package:dash_chat_app/features/profile/profile_screen.dart';
import 'package:dash_chat_app/styles/k_colors.dart';
import 'package:dash_chat_app/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatViewModel _chatViewModel = ChatViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.chatAppBarBackground,
        title: Row(
          children: [
            Text(
              "dashchat",
              style: KTextStyle.body1.copyWith(
                fontWeight: FontWeight.bold,
                color: KColors.secondary,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Text(
                '+6 Online | 100 dashers',
                style: KTextStyle.subtitle2.copyWith(
                  color: KColors.primary,
                ),
              ),
            )
          ],
        ),
        titleSpacing: 25,
        leadingWidth: 0,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
              child: const CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: KColors.secondary,
                radius: 21,
              ),
            ),
          )
        ],
      ),
      backgroundColor: KColors.chatScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              /// Chat ListView
              Expanded(
                child: StreamBuilder(
                  stream: _chatViewModel.messages,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ChatModel>> snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: KColors.primary,
                        ),
                      );
                    }

                    return ListView.builder(
                        reverse: true,
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (_, i) =>
                            ChatRow(chat: snapshot.data![i]));
                  },
                ),
              ),
              const SizedBox(height: 10.0,),
              /// Message Input
              Row(
                children:  [
                  const Expanded(
                    child: MessageTextField(),
                  ),
                  const SizedBox(width: 10.0,),
                  IconButton(
                    padding: const EdgeInsets.all(0.0),
                    icon: const Icon(Icons.send,size: 45,),
                    color: KColors.secondary,
                    onPressed: () {  },),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MessageTextField extends StatelessWidget{
  const MessageTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: KColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.10),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            style: KTextStyle.subtitle2.copyWith(color: KColors.secondary),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: KTextStyle.subtitle2.copyWith(color: KColors.secondary),
              hintText: 'Write Something',

              
            )),
      ),
    );
  }
}

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
                textAlign: isMe ? TextAlign.right : TextAlign.left,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
