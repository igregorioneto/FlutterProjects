import 'package:extract/app/presenter/themes/colors.dart';
import 'package:flutter/cupertino.dart';

class TitleResultWidget extends StatelessWidget {
  final String title;
  final String result;

  const TitleResultWidget({
    super.key,
    required this.title,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              result,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
