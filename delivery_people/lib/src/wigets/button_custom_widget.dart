import 'package:flutter/material.dart';

class ButtonCustomWidget extends StatelessWidget {
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  final String titleButton;
  final IconData? icon;
  final bool isIcon;

  const ButtonCustomWidget({
    super.key,
    required this.buttonColor,
    required this.borderColor,
    required this.textColor,
    required this.titleButton,
    required this.isIcon,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: borderColor),
        ),
        primary: buttonColor,
      ),
      onPressed: () {},
      icon: isIcon ? Icon(icon, color: textColor) : Column(),
      label: Text(
        titleButton,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
