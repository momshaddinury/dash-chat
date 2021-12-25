import 'package:flutter/material.dart';

/// constants
const kPrimaryColor = Color(0xFF414138);
const kSecondaryColor = Color(0xFF37972e);
const kGreyColor = Color(0xFF858585);
const kBlackColor = Colors.black;
const kWhiteColor = Colors.white;
const contentSpacing = 16.0;


class LoginScreen extends StatelessWidget {
   const LoginScreen({Key? key}) : super(key: key);

  /// styles
    static const double bodyPadding = 16.0;
    static const TextStyle primaryHeadingTextStyle = TextStyle(
      fontSize: 30,
      color: kSecondaryColor,
      fontWeight: FontWeight.bold
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(bodyPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// A Picture
                const SizedBox(height: 100, width: double.infinity,),
                /// The Heading
                const DoubleColorText(
                  primaryText: 'Sign ',
                  secondaryText: 'In',
                  primaryColor: Colors.black,
                  fontSize: 32,
                ),
                const SizedBox(height: 5.0,),
                const Text('join the dashers', style: TextStyle(
                  fontSize: 17.0,
                  color: kGreyColor
                ),),
                const SizedBox(height: 30.0,),
                /// The Form
                const PrimaryInputTextField(
                  labelText: 'Email ID',
                  prefixIcon: Icons.alternate_email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const PrimaryInputTextField(
                    labelText: 'Password',
                    prefixIcon: Icons.lock_outline,
                    obscureText: true,
                    bottomSpace: contentSpacing*2,
                ),
                const SizedBox(height: 30.0,),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryActionButton(
                    onPressed: (){},
                    buttonText: 'Login',
                  ),
                ),
                const SizedBox(height: contentSpacing,),
                TextButton(
                  onPressed: (){},
                  child: const DoubleColorText(
                      primaryText: "Don't have an account? ",
                      secondaryText: "Create One"),
                ),
                const SizedBox(height: 10.0,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoubleColorText extends StatelessWidget{
  final String primaryText;
  final String secondaryText;
  final Color primaryColor;
  final Color secondaryColor;
  final double fontSize;
  final FontWeight fontWeight;

  const DoubleColorText({
    Key? key,
    required this.primaryText,
    required this.secondaryText,
    this.primaryColor = kGreyColor,
    this.secondaryColor = kSecondaryColor,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
  }
    ) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      text: primaryText,
      style: TextStyle(color: primaryColor, fontSize: fontSize, fontWeight: fontWeight),
      children: [
        TextSpan(text: secondaryText, style: TextStyle(color: secondaryColor)),
      ]
    ));
  }
}

class PrimaryInputTextField extends StatelessWidget{

  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final double bottomSpace;

  const PrimaryInputTextField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.bottomSpace = contentSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kWhiteColor,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 18.0, 0.0),
        child: TextField(
            textAlignVertical: TextAlignVertical.center,
            obscureText: false,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(bottom: -5.0),
              prefixIcon: Icon(prefixIcon, color: kSecondaryColor,),
              hintStyle: const TextStyle(color: kGreyColor, fontSize: 14, fontWeight: FontWeight.normal),
              hintText: labelText,
            )),
      ),
    );
  }
}

class PrimaryActionButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  const PrimaryActionButton({Key? key,required this.onPressed, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
          onPressed: onPressed, child: Text(buttonText),
          style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical:18.0, horizontal: 10.0),
        primary: kPrimaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
      )),
    );
  }
}
