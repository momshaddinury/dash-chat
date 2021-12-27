import 'package:dash_chat_app/styles/k_colors.dart';
import 'package:dash_chat_app/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class _KButton extends StatelessWidget {
  const _KButton({
    required this.child,
    required this.onPressed,
    this.backgroundColor = KColors.primary,
    this.height = 50,
    this.width = double.infinity,
    this.border,
    this.borderRadius,
  });

  final Widget child;
  final Color backgroundColor;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final Border? border;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}

class KFilledButton extends _KButton {
  KFilledButton({
    required String buttonText,
    required VoidCallback onPressed,
    Color buttonColor = KColors.accent,
  }) : super(
          child: Center(
            child: Text(
              buttonText,
              style: KTextStyle.subtitle2.copyWith(
                color: KColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          onPressed: onPressed,
          backgroundColor: buttonColor,
          height: 44,
          borderRadius: BorderRadius.circular(6),
        );
}
