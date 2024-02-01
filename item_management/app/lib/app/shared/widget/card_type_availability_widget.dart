import 'package:app/app/shared/utils/colors.dart';
import 'package:app/app/shared/utils/titles.dart';
import 'package:flutter/material.dart';

class CardTypeAvailabilityWidget extends StatelessWidget {
  final String status;

  const CardTypeAvailabilityWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final title = titlesCardTypeItem(status);

    return Container(
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: goTypeColor(status),
        ),
      ),
      color: goTypeColor(status).withOpacity(0.2),
      padding: EdgeInsets.all(6),
    );
  }
}
