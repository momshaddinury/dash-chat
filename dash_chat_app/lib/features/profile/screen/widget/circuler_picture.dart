import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../profile_screen.dart';

class CirculerPicture extends StatelessWidget {
  const CirculerPicture({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
  }) : super(key: key);

  final String? imageUrl;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: width ?? 170,
        minHeight: height ?? 170,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.contain,
              )
            : null,
        shape: BoxShape.circle,
      ),
      child: imageUrl == null
          ? SvgPicture.asset(
              "assets/svg/profile_pic_icon.svg",
              fit: BoxFit.scaleDown,
            )
          : const SizedBox(),
    );
  }
}
