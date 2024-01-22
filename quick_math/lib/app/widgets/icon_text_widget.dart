import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  String text;

  IconTextWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.lightBlueAccent,
          size: 32,
        ),
        SizedBox(width: 5),
        Text(
          '$text',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ],
    );
  }
}
