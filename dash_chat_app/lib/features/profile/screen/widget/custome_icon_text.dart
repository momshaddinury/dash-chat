import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../profile_screen.dart';

class CustomIconText extends StatelessWidget {
  const CustomIconText({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String icon;
  final String text;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xffF6F6F6),
              blurRadius: 2,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 16,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              width: 26.5,
            ),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
