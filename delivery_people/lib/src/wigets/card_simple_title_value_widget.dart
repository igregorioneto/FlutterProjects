import 'package:delivery_people/src/utils/colors.dart';
import 'package:flutter/material.dart';

class CardSimpleTitleValueWidget extends StatelessWidget {
  final String title;
  final String value;
  final double? width;
  final double? height;

  const CardSimpleTitleValueWidget({
    super.key,
    required this.title,
    required this.value,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 90,
      height: height ?? 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.gray3,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
