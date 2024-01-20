import 'package:flutter/material.dart';
import 'package:math_game/app/util/constants.dart';

class ResultMessage extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
  final icon;

  ResultMessage({
    super.key,
    required this.message,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              message,
              style: whiteTextStyle,
            ),
            MaterialButton(
              onPressed: onTap,
              color: Colors.blueGrey[300],
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
