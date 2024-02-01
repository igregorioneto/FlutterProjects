import 'package:app/app/core/models/item.dart';
import 'package:app/app/shared/widget/button_simple_widget.dart';
import 'package:app/app/shared/widget/card_type_availability_widget.dart';
import 'package:app/app/shared/widget/status_progress_type_widget.dart';
import 'package:app/app/store/item.store.dart';
import 'package:flutter/material.dart';

class CardItemListWidget extends StatelessWidget {
  final Item item;
  final VoidCallback click;
  final bool itemMovimentation;

  const CardItemListWidget({
    super.key,
    required this.item,
    required this.click,
    required this.itemMovimentation,
  });

  @override
  Widget build(BuildContext context) {
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
                    child: CardTypeAvailabilityWidget(
                        status: item.status),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: StatusProgressTypeWidget(
                        status: item.status),
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
            itemMovimentation ? Expanded(
              child: ButtonSimpleWidget(
                title: 'Movimentar',
                click: click,
                color: Colors.lightBlue.shade50,
                titleColor: Colors.lightBlue,
                fullButton: true,
              ),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
