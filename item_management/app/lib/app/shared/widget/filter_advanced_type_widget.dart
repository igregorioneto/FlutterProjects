import 'package:app/app/shared/widget/button_icon_widget.dart';
import 'package:flutter/material.dart';

class FilterAdvancedTypeWidget extends StatelessWidget {
  const FilterAdvancedTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonIconWidget(
          icon: Icons.filter_alt_rounded,
          title: 'Filtros',
          click: () {},
        ),
        SizedBox(width: 10),
        ButtonIconWidget(
          icon: Icons.menu_outlined,
          title: 'Ordenamento',
          click: () {},
        ),
      ],
    );
  }
}
