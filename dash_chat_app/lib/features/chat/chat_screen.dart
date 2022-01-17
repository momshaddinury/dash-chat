import 'package:dash_chat_app/features/chat/chat_model.dart';
import 'package:dash_chat_app/features/chat/chat_view_model.dart';
import 'package:dash_chat_app/features/chat/widgets/chat_row.dart';
import 'package:dash_chat_app/features/profile/profile_screen.dart';
import 'package:dash_chat_app/styles/k_colors.dart';
import 'package:dash_chat_app/styles/k_text_style.dart';
import 'package:dash_chat_app/widgets/k_text_field.dart';
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
                    child: KPlainTextField(
                      hinText: 'Write Something',
                    ),
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



