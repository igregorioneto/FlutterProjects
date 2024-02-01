import 'package:app/app/core/models/item.dart';
import 'package:app/app/core/services/item_service.dart';
import 'package:app/app/shared/utils/colors.dart';
import 'package:app/app/shared/widget/button_icon_widget.dart';
import 'package:app/app/shared/widget/button_simple_widget.dart';
import 'package:app/app/shared/widget/card_item_list_widget.dart';
import 'package:app/app/shared/widget/card_type_availability_widget.dart';
import 'package:app/app/shared/widget/filter_advanced_type_widget.dart';
import 'package:app/app/shared/widget/filter_simple_type_widget.dart';
import 'package:app/app/shared/widget/status_progress_type_widget.dart';
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
    void fnAdvancedFilter() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Filtro Avançado'),
            content: SizedBox(
              height: 200,
              child: Column(
                children: [
                  // Filter status
                  DropdownButton(
                    value: itemStore.selectedStatusFilter,
                    items: [
                      'Todos',
                      'Quarentena',
                      'Recebimento',
                      'Armazenamento'
                    ].map(
                      (String filter) {
                        return DropdownMenuItem(
                          value: filter,
                          child: Text(filter),
                        );
                      },
                    ).toList(),
                    onChanged: (String? value) {
                      if (value != null) {
                        itemStore.selectedStatusFilter = value;
                      }
                    },
                  ),

                  // Filter order
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Ordem'),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      itemStore.selectedOrderFilter = int.tryParse(value) ?? 0;
                    },
                  ),

                  // Filter lot
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Numeração'),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      itemStore.selectedNumerationFilter =
                          int.tryParse(value) ?? 0;
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  itemStore.resetFilter = true;
                  itemStore.fetchAdvancedFilter();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Zerar Filtros',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  itemStore.fetchAdvancedFilter();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Filtrar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    void fnMovimentationItem(Item item) {
      showDialog(
        context: context,
        builder: (BuildContext builder) {
          return AlertDialog(
            title: Text(
              'Movimentação do Item - ${item.numeration}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            content: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Divider(),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 22, color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Para confirmar o armazenamento do item na ',
                        ),
                        TextSpan(
                          text: 'Área de Armazenamento',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' clique em confirmar.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ButtonSimpleWidget(
                title: 'Confirmar',
                color: Colors.blue,
                click: () {
                  print(item.name);
                  Navigator.of(context).pop();
                },
                fullButton: false,
              ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Buttons Filter
          FilterAdvancedTypeWidget(
            click1: () {
              fnAdvancedFilter();
            },
            click2: itemStore.fetchOrdenationItensByName,
          ),

          // Buttons click filter [Receiving]/[Quarantine]
          SizedBox(height: 10),
          FilterSimpleTypeWidget(
            click1: itemStore.fetchItemsReceiving,
            click2: itemStore.fetchItemsQuarantine,
          ),

          // Item information
          SizedBox(height: 10),
          Observer(
            builder: (context) {
              return Padding(
                padding: EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Itens Encontrados: ${itemStore.itemsFilter.length}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Peso: ${itemStore.weightItems.toStringAsFixed(2)} kg',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // List Itens
          SizedBox(height: 10),
          Observer(
            builder: (context) {
              return Expanded(
                child: ListView.builder(
                  itemCount: itemStore.itemsFilter.length,
                  itemBuilder: (context, index) {
                    final item = itemStore.itemsFilter.length > index
                        ? itemStore.itemsFilter[index]
                        : null;
                    if (itemStore.isLoading == true) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      if (item != null) {
                        return CardItemListWidget(
                          item: item,
                          click: () => fnMovimentationItem(item),
                        );
                      }
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
