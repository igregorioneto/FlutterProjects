import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedMoneyWidget extends StatelessWidget {
  String value;

  AnimatedMoneyWidget({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add,
            color: Colors.green,
            size: 24,
          ),
          SizedBox(width: 3),
          Icon(
            Icons.money_outlined,
            color: Colors.green,
            size: 24,
          ),
          SizedBox(width: 3),
          TypewriterAnimatedTextKit(
            text: [value],
            speed: Duration(milliseconds: 500),
            textStyle: TextStyle(
              fontSize: 24,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
