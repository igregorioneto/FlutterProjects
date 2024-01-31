import 'package:app/app/shared/utils/colors.dart';
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
                return Card(
                  color: Colors.white.withOpacity(1),
                  elevation: 5,
                  shadowColor: Colors.grey,
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Container(
                                  child: Text(
                                    'DISPONÍVEL PARA ARMAZENAMENTO',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                      color: storageColor,
                                    ),
                                  ),
                                  color: storagesBackground,
                                  padding: EdgeInsets.all(6),
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Row(
                                  children: [
                                    Text(
                                      'Quarentena',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward),
                                    Text(
                                      'Armazenamento',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text(
                            item.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text('(${item.numeration})'),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'OR: ${item.order}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Qtd: ${item.quantity}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lote: ${item.lot}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lote: ${item.barcode}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Expanded(
                          child: ButtonSimpleWidget(
                            title: 'Movimentar',
                            click: () {},
                            color: Colors.lightBlue.shade50,
                            titleColor: Colors.lightBlue,
                            fullButton: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
