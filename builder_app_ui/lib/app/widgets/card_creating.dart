import 'package:flutter/material.dart';

class CardCreating extends StatelessWidget {
  final double height;
  final double width;
  final Color boxColor;
  final Icon iconContainer;
  final String textTitle;
  final String textDescription;

  const CardCreating({
    super.key,
    required this.height,
    required this.width,
    required this.boxColor,
    required this.iconContainer,
    required this.textTitle,
    required this.textDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.shade200,
      child: Column(
        children: [
          Container(
            child: iconContainer,
            height: height,
            width: width,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(textTitle),
              SizedBox(height: 10),
              Text(textDescription),
              SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}
