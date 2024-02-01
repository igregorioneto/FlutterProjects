import 'package:app/app/shared/utils/colors.dart';
import 'package:app/app/shared/widget/button_simple_widget.dart';
import 'package:flutter/material.dart';

class FilterSimpleTypeWidget extends StatelessWidget {
  const FilterSimpleTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          ButtonSimpleWidget(
            title: 'Área de Recebimento',
            color: receivingColor.withOpacity(0.5),
            click: () {},
            fullButton: false,
          ),
          SizedBox(width: 10),
          ButtonSimpleWidget(
            title: 'Área de Quarentena',
            color: quarentineColor.withOpacity(0.5),
            click: () {},
            fullButton: false,
          ),
        ],
      ),
    );
  }
}
