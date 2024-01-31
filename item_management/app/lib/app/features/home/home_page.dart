import 'package:app/app/store/item.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    Provider.of<ItemStore>(context, listen: false).fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    final itemStore = Provider.of<ItemStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Itens aguardando movimentação'),
      ),
      body: Observer(
        builder: (_) {
          if (itemStore.items.isEmpty) {
            return Center(
              child: Text('No Items loaded'),
            );
          } else {
            return Column(
              children: itemStore.items
                  .map((item) => ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.status),
                      ))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}
