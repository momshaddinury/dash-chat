import 'package:dash_chat_app/features/login/login_screen.dart';
import 'package:dash_chat_app/styles/k_assets.dart';
import 'package:dash_chat_app/styles/k_colors.dart';
import 'package:dash_chat_app/widgets/k_button.dart';
import 'package:dash_chat_app/widgets/k_text_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(height: 30),
                DottedBorder(
                  padding: const EdgeInsets.all(5),
                  borderType: BorderType.Circle,
                  dashPattern: const [6, 4],
                  color: KColors.primary,
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(border: Border.all(style: BorderStyle.none), borderRadius: BorderRadius.circular(85)),
                    child: Image.asset(KAssets.upload),
                  ),
                ),
                const SizedBox(height: 70),
                const KTextField(
                  hinText: 'Full name',
                  prefixIcon: KAssets.profile,
                  obscureText: false,
                ),
                const SizedBox(height: 16),
                const KTextField(
                  hinText: 'Email',
                  prefixIcon: KAssets.email,
                  obscureText: false,
                ),
                const SizedBox(height: 150),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: KFilledButton(
                      buttonText: 'Dash Out',
                      width: 143,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
