import 'package:flutter/material.dart';

class ButtonSimpleWidget extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Color color;
  final VoidCallback click;

  const ButtonSimpleWidget({
    super.key,
    required this.title,
    this.titleColor,
    required this.color,
    required this.click,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: click,
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
