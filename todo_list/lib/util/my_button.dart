import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  VoidCallback onClick;

  MyButton({
    super.key,
    required this.title,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onClick,
      color: Theme.of(context).primaryColor,
      child: Text(title, style: TextStyle(color: Colors.white),),
    );
  }
}
