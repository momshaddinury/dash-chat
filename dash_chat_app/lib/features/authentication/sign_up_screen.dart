import 'package:dash_chat_app/features/authentication/login_screen.dart';
import 'package:dash_chat_app/styles/k_assets.dart';
import 'package:dash_chat_app/styles/k_colors.dart';
import 'package:dash_chat_app/styles/k_text_style.dart';
import 'package:dash_chat_app/widgets/k_button.dart';
import 'package:dash_chat_app/widgets/k_text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 50),
                RichText(
                  text: TextSpan(
                    text: 'Dash ',
                    style: KTextStyle.headline1.copyWith(
                      color: KColors.black,
                    ),
                    children: [
                      TextSpan(
                          text: 'Up',
                          style: KTextStyle.headline1.copyWith(
                            color: KColors.primary,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'join the dashers',
                  style: KTextStyle.body1.copyWith(color: KColors.secondary),
                ),
                const SizedBox(height: 100),
                const KTextField(
                  hinText: 'Email',
                  prefixIcon: KAssets.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 14),
                const KTextField(
                  hinText: 'Password',
                  prefixIcon: KAssets.password,
                  obscureText: true,
                ),
                const SizedBox(height: 14),
                const KTextField(
                  hinText: 'Confirm Password',
                  prefixIcon: KAssets.password,
                  obscureText: true,
                ),
                const SizedBox(height: 100),
                KFilledButton(
                    buttonText: 'Dash Up',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }),
                const SizedBox(height: 90),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Already a dasher?',
                        style: KTextStyle.subtitle2.copyWith(
                          color: KColors.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                              text: ' Dash In',
                              style: KTextStyle.subtitle2.copyWith(
                                color: KColors.primary,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
