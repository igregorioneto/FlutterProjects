import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final Widget icon;
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
        Container(
          width: 32, // Limite de largura para o ícone
          child: icon,
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
