import 'package:delivery_people/src/utils/colors.dart';
import 'package:flutter/material.dart';

class TextTitleValueCustomWidget extends StatelessWidget {
  final String title;
  final String value;
  final double? titleSize;
  final double? valueSize;

  const TextTitleValueCustomWidget({
    super.key,
    required this.title,
    required this.value,
    this.titleSize,
    this.valueSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleSize ?? 16,
            fontFamily: 'Poppins',
            color: AppColors.gray4,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: valueSize ?? 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: AppColors.orangeDark,
          ),
        ),
      ],
    );
  }
}
