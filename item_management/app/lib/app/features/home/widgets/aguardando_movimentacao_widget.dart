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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Buttons Filter
          FilterAdvancedTypeWidget(),

          // Buttons click filter [Receiving]/[Quarantine]
          SizedBox(height: 10),
          FilterSimpleTypeWidget(),

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
                  'Peso: ${itemStore.weightItems} kg',
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

                if (itemStore.isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (itemStore.items.isEmpty) {
                  return Center(
                    child: Text(
                      'Nenhum item cadastrado...',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }

                return CardItemListWidget(item: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}
