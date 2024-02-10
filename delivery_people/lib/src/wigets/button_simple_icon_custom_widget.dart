import 'package:flutter/material.dart';

class ButtonSimpleIconCustomWidget extends StatelessWidget {
  final VoidCallback click;
  final IconData icon;
  final Color color;
  final double size;

  const ButtonSimpleIconCustomWidget({
    super.key,
    required this.click,
    required this.icon,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: click,
      icon: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
