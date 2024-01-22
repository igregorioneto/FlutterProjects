import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  int value;
  final VoidCallback onTap;

  MyButton({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: MaterialButton(
        onPressed: onTap,
        color: Colors.lightBlueAccent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              value.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 36,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
