import 'package:app/app/features/home/widgets/structure_items_movimentation_widget.dart';
import 'package:app/app/features/home/widgets/itens_movimentados_widgets.dart';
import 'package:app/app/store/item.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _controller;
  late ItemStore _itemStore;

  @override
  void initState() {
    super.initState();

    _itemStore = Provider.of<ItemStore>(context, listen: false);
    _controller = TabController(length: 2, vsync: this);

    _controller.addListener(() {
      _handleTabChange(_controller.index);
    });

    _itemStore.fetchItems();
  }

  void _handleTabChange(int index) {
    setState(() {
      _itemStore.updatingIsItemsMovimentations(index == 1);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemStore = Provider.of<ItemStore>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Itens aguardando movimentação',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Icon(Icons.arrow_back_outlined, color: Colors.blue),
          actions: [
            Text(
              'Usuário',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_2_outlined,
                color: Colors.blue,
                size: 25,
              ),
            ),
          ],
          bottom: TabBar(
            controller: _controller,
            tabs: [
              Tab(text: 'Aguardando Movimentação'),
              Tab(text: 'Itens Movimentados'),
            ],
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.blue,
            ),
            indicatorWeight: 1,
            indicatorColor: Colors.lightBlue,
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.grey,
            ),
            onTap: (index) {
              _controller.animateTo(index);
            },
          ),
        ),
        body: Observer(
          builder: (_) {
            return TabBarView(
              controller: _controller,
              children: [
                StructureItemsMovimentationWidget(
                  itemStore: itemStore,
                  itemMovimentation: true,
                  isItemsMovimentations: !itemStore.isItemsMovimentations,
                ),
                // Movimentation Items
                StructureItemsMovimentationWidget(
                  itemStore: itemStore,
                  itemMovimentation: false,
                  isItemsMovimentations: itemStore.isItemsMovimentations,
                ),
                //ItensMovimentadosWidgets(),
              ],
            );
          },
        ));
  }
}
