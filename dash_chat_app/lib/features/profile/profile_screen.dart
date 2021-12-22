import 'package:flutter/material.dart';

// ============= constants ===========
const primaryColor = Color(0xFF0165ff);
const secondaryColor = Color(0xFF2f3f5e);
const contentSpacing = 16.0;


class ProfileScreen extends StatelessWidget {
   const ProfileScreen({Key? key}) : super(key: key);

  // ============= styles ===========
    static const double bodyPadding = 16.0;
    static const TextStyle primaryHeadingTextStyle = TextStyle(
      fontSize: 30,
      color: secondaryColor,
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
                // ============= A PICTURE ===========
                const SizedBox(height: 180, width: double.infinity,),
                // ============= The Heading ===========
                const Text('Login', style: primaryHeadingTextStyle, textAlign: TextAlign.left,),
                const SizedBox(height: 10.0,),
                // ============= The Form ===========
                const PrimaryInputTextField(
                  labelText: 'Email ID',
                  prefixIcon: Icons.alternate_email,
                  keyboardType: TextInputType.emailAddress,
                ),
                PrimaryInputTextField(
                    labelText: 'Password',
                    prefixIcon: Icons.lock_outline,
                    obscureText: true,
                    suffixWidget: TextButton(onPressed: (){}, child: const Text('Forget?')),
                    bottomSpace: contentSpacing*2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryActionButton(
                    onPressed: (){},
                    buttonText: 'Login',
                  ),
                ),
                const SizedBox(height: contentSpacing,),
                TextButton(onPressed: (){}, child: Text('Or, sign up...', style: TextStyle(fontSize: 14.0, color: Colors.grey.shade500),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryInputTextField extends StatelessWidget{

  final String labelText;
  final IconData prefixIcon;
  final Widget? suffixWidget;
  final bool obscureText;
  final TextInputType keyboardType;
  final double bottomSpace;

  const PrimaryInputTextField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.suffixWidget,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.bottomSpace = contentSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomSpace),
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIconConstraints: const BoxConstraints(minWidth: 23, maxHeight: 23),
          prefixIcon:  Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(prefixIcon),
          ),
          labelText: labelText,
          suffixIcon: suffixWidget,
        ),
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
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: onPressed, child: Text(buttonText),
          style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical:23.0, horizontal: 10.0),
        primary: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
      )),
    );
  }
}
