import 'package:delivery_people/src/utils/colors.dart';
import 'package:flutter/material.dart';

class TextTitleInfoCustomWidget extends StatelessWidget {
  final String title;
  final String address;
  final double distance;
  final double? titleSize;
  final double? valueSize;
  final double? distanceSize;

  const TextTitleInfoCustomWidget({
    super.key,
    required this.title,
    required this.address,
    required this.distance,
    this.titleSize,
    this.valueSize,
    this.distanceSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleSize ?? 18,
            fontFamily: 'Poppins',
            color: AppColors.orangeDark,
          ),
        ),
        Text(
          address,
          style: TextStyle(
            fontSize: valueSize ?? 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: AppColors.gray4,
          ),
        ),
        Text(
          'Distancia: ${distance}km',
          style: TextStyle(
            fontSize: distanceSize ?? 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: AppColors.gray4,
          ),
        ),
      ],
    );
  }
}
