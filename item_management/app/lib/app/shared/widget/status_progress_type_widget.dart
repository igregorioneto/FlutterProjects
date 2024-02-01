import 'package:app/app/shared/utils/titles.dart';
import 'package:flutter/material.dart';

class StatusProgressTypeWidget extends StatelessWidget {
  final String status;

  const StatusProgressTypeWidget({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          titlesStatusTypeItem(status),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Icon(Icons.arrow_forward),
        Text(
          titlesStatusNextTypeItem(status),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
