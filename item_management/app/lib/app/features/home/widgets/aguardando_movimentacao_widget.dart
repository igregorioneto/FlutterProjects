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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Buttons Filter
          FilterAdvancedTypeWidget(),

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
                        return CardItemListWidget(item: item);
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
