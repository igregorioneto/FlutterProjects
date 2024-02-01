import 'package:app/app/shared/widget/button_icon_widget.dart';
import 'package:flutter/material.dart';

class FilterAdvancedTypeWidget extends StatelessWidget {
  final VoidCallback click1;
  final VoidCallback click2;

  const FilterAdvancedTypeWidget({
    super.key,
    required this.click1,
    required this.click2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonIconWidget(
          icon: Icons.filter_alt_rounded,
          title: 'Filtros',
          click: click1,
        ),
        SizedBox(width: 10),
        ButtonIconWidget(
          icon: Icons.menu_outlined,
          title: 'Ordenamento',
          click: click2,
        ),
      ],
    );
  }
}
