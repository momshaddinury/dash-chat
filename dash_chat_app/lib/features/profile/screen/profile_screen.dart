import 'package:dash_chat_app/features/profile/profile_model.dart';
import 'package:dash_chat_app/features/profile/profile_view_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/circuler_picture.dart';
import 'widget/custome_icon_text.dart';
import 'widget/k_text_button.dart';

//Style
const primaryColor = Color(0xff38972E);
const secondaryColor = Color(0xff414139);
var textStyle = GoogleFonts.roboto(
  textStyle: const TextStyle(
    color: Color(0xff828282),
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 18.75 / 16,
  ),
);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileViewModel _profileViewModel = ProfileViewModel();

  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();

  late final ProfileModel _user;

  @override
  void initState() {
    _user = _profileViewModel.getUserProfile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double customWidth(double v) {
      return (v / 375) * MediaQuery.of(context).size.width;
    }

    double customHight(double v) {
      return (v / 812) * MediaQuery.of(context).size.height;
    }

    return Scaffold(
      // backgroundColor: const Color(0xffE5E5E5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: customHight(30),
            ),
            _profilePicture(customHight, customWidth),
            SizedBox(
              height: customHight(89),
            ),
            CustomIconText(
              text: _user.name,
              icon: "assets/svg/txt_name.svg",
            ),
            SizedBox(
              height: customHight(14),
            ),
            _user.email != null
                ? CustomIconText(
                    text: _user.email!,
                    icon: "assets/svg/txt_email.svg",
                  )
                : const SizedBox(),
            SizedBox(
              height: customHight(14),
            ),
            _user.phone != null
                ? CustomIconText(
                    text: _user.phone!,
                    icon: "assets/svg/phone-call.svg",
                  )
                : const SizedBox(),
            SizedBox(
              height: customHight(160),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: KTextButton(
                text: "Logout",
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: customHight(30),
            ),
          ],
        ),
      ),
    );
  }

  Center _profilePicture(
      double customHight(double v), double customWidth(double v)) {
    return Center(
      child: DottedBorder(
        padding: const EdgeInsets.all(5),
        borderType: BorderType.Circle,
        dashPattern: const [6, 4],
        color: primaryColor,
        child: CirculerPicture(
          imageUrl: _user.imageUrl,
          height: customHight(170),
          width: customWidth(170),
        ),
      ),
    );
  }
}
