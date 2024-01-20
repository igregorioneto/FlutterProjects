import 'package:flutter/material.dart';
import 'package:math_game/app/util/constants.dart';

class MyButton extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  var buttonColor = Colors.blueGrey;

  MyButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (child == 'C') {
      buttonColor = Colors.green;
    } else if (child == 'DEL') {
      buttonColor = Colors.red;
    } else if (child == '=') {
      buttonColor = Colors.blueGrey;
    }

    return Padding(
      padding: EdgeInsets.all(3),
      child: MaterialButton(
        onPressed: onTap,
        color: buttonColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              child,
              style: whiteTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
