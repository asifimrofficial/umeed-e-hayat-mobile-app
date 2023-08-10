import 'package:blood_donation_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class RoundedBorderFormField extends StatelessWidget {
  final IconData leadingIcon;
  final int lines;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyBoardType;
  final Widget? suffixIcon;
  var autofillHints;
  RoundedBorderFormField({
    this.lines = 1,
    this.keyBoardType = TextInputType.text,
    required this.leadingIcon,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    autofillHints,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //on select how to chnage the border
      autocorrect: true,
      autofillHints: autofillHints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyBoardType,
      maxLines: lines,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          leadingIcon,
          color: const Color(0xffFF2156),
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          // borderSide: BorderSide., // Hide the border when focused
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      cursorColor: const Color(0xffFF2156),
    );
  }
}
