import 'package:app/app/shared/utils/colors.dart';
import 'package:app/app/shared/widget/button_simple_widget.dart';
import 'package:flutter/material.dart';

class FilterSimpleTypeWidget extends StatelessWidget {
  final VoidCallback click1;
  final VoidCallback click2;

  const FilterSimpleTypeWidget({
    super.key,
    required this.click1,
    required this.click2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          ButtonSimpleWidget(
            title: 'Área de Recebimento',
            color: receivingColor.withOpacity(0.5),
            click: click1,
            fullButton: false,
          ),
          SizedBox(width: 10),
          ButtonSimpleWidget(
            title: 'Área de Quarentena',
            color: quarentineColor.withOpacity(0.5),
            click: click2,
            fullButton: false,
          ),
        ],
      ),
    );
  }
}
