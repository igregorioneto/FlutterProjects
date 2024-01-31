import 'package:app/app/shared/widget/button_icon_widget.dart';
import 'package:app/app/shared/widget/button_simple_widget.dart';
import 'package:app/app/store/item.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AguardandoMovimentacaoWidget extends StatelessWidget {
  final ItemStore itemStore;

  const AguardandoMovimentacaoWidget({
    super.key,
    required this.itemStore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Buttons Filter
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

          // Buttons click filter [Receiving]/[Quarantine]
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                ButtonSimpleWidget(
                  title: 'Área de Recebimento',
                  color: Colors.blue,
                  click: () {},
                ),
                SizedBox(width: 10),
                ButtonSimpleWidget(
                  title: 'Área de Quarentena',
                  color: Colors.orangeAccent,
                  click: () {},
                ),
              ],
            ),
          ),

          // Item information
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Itens Encontrados: ${itemStore.items.length}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Peso: 188.544,01 kg',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // List Itens
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: itemStore.items.length,
              itemBuilder: (context, index) {
                final item = itemStore.items[index];
                return ListTile(
                  title: Text(item.name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
