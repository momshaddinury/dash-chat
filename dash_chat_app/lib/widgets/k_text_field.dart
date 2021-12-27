import 'package:dash_chat_app/styles/k_colors.dart';
import 'package:dash_chat_app/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class KTextField extends StatelessWidget {
  final String hinText;
  final String prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;

  const KTextField({
    Key? key,
    required this.hinText,
    required this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
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
            obscureText: obscureText,
            style: KTextStyle.subtitle2.copyWith(color: KColors.secondary),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Image.asset(prefixIcon),
              hintStyle: KTextStyle.subtitle2.copyWith(color: KColors.secondary),
              hintText: hinText,
            )),
      ),
    );
  }
}
