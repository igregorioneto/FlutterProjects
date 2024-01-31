import 'package:app/app/features/home/widgets/aguardando_movimentacao_widget.dart';
import 'package:app/app/features/home/widgets/itens_movimentados_widgets.dart';
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
        title: Text(
          'Itens para movimentação',
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
        ),
      ),
      body: Observer(
        builder: (_) {
          return TabBarView(
            children: [
              AguardandoMovimentacaoWidget(itemStore: itemStore),
              ItensMovimentadosWidgets(),
            ],
          );
        },
      )
    );
  }
}
