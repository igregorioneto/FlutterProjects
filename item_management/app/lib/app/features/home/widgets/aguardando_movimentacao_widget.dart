import 'package:app/app/shared/widget/button_icon_widget.dart';
import 'package:flutter/material.dart';

class AguardandoMovimentacaoWidget extends StatelessWidget {
  const AguardandoMovimentacaoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
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
          ),
        ],
      ),
    );
  }
}
