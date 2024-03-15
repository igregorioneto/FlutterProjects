import 'package:flutter/material.dart';

class ColorSelectorBotton extends StatelessWidget {
  final MaterialColor colorBase;
  final MaterialColor selectedColor;
  final Function() onSelected;

  const ColorSelectorBotton({
    super.key,
    required this.colorBase,
    required this.selectedColor,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: colorBase.shade50,
          border: Border.all(
            color: selectedColor == colorBase ? colorBase : Colors.grey,
            width: selectedColor == colorBase ? 2 : 1,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
