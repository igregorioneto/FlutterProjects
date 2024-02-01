import 'package:flutter/material.dart';

class ButtonSimpleWidget extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Color color;
  final Function click;
  final bool fullButton;

  const ButtonSimpleWidget({
    super.key,
    required this.title,
    this.titleColor,
    required this.color,
    required this.click,
    required this.fullButton,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: fullButton ? double.infinity : 150,
      onPressed: () {
        click();
      },
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: titleColor ?? Colors.white,
        ),
      ),
      color: color,
    );
  }
}
