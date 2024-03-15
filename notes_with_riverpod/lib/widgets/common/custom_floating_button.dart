import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFloatingButton extends StatelessWidget {
  final Function() onPressed;

  const CustomFloatingButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      onPressed: onPressed,
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
