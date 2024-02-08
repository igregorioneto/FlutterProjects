import 'package:delivery_people/src/utils/colors.dart';
import 'package:flutter/material.dart';

class ButtonIconCustomWidget extends StatelessWidget {
  final String titleButton;
  final String imageButton;
  final Color borderColor;
  final Color titleColor;
  final Color buttonColor;

  const ButtonIconCustomWidget({
    super.key,
    required this.titleButton,
    required this.imageButton,
    required this.borderColor,
    required this.titleColor,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Image.asset(imageButton),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: borderColor),
        ),
        primary: buttonColor,
      ),
      label: Text(
        titleButton,
        style: TextStyle(
          color: titleColor,
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
