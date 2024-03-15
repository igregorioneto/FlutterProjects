import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavigationWidget extends StatelessWidget {
  final List<Widget> buttons;

  const BottomNavigationWidget({
    super.key,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5,
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
      color: Theme.of(context).colorScheme.primary,
      child: IconTheme(
        data: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...buttons.expand(
                (button) => [
                  const SizedBox(width: 12),
                  button,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
