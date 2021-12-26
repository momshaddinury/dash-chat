import 'package:flutter/material.dart';

class KTextButton extends StatelessWidget {
  const KTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(143, 44),
          primary: const Color(0xff414138),
        ),
      ),
    );
  }
}
