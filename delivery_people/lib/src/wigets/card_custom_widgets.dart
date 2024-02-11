import 'package:delivery_people/src/utils/colors.dart';
import 'package:flutter/material.dart';

class CardCustomWidget extends StatelessWidget {
  final String title;
  final Widget customWidget;

  const CardCustomWidget({
    super.key,
    required this.title,
    required this.customWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                fontFamily: 'Poppins',
              ),
            ),
          ),

          // Custom Widget
          customWidget,

          SizedBox(height: 8),
        ],
      ),
    );
  }
}
