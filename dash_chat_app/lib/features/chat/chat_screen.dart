import 'package:dash_chat_app/features/profile/profile_screen.dart';
import 'package:dash_chat_app/styles/k_colors.dart';
import 'package:dash_chat_app/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.chatAppBarBackground,
        title: Text(
          "dashchat",
          style: KTextStyle.body1.copyWith(
            fontWeight: FontWeight.bold,
            color: KColors.secondary,
          ),
        ),
        titleSpacing: 25,
        leadingWidth: 0,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
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
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
