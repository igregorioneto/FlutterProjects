import 'package:flutter/material.dart';

class ButtonIconWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback click;

  const ButtonIconWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.click,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: click,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(180, 40),
        backgroundColor: Colors.lightBlue[50],
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blue,),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
