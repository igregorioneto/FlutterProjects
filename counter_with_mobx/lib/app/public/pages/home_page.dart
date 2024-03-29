import 'package:counter_with_mobx/app/store/count.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

@override
Widget build(BuildContext context) {
  final store = CounterStore();
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .inversePrimary,
      title: Text('Counter'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Observer(
            builder: (_) => Text(
              '${store.counter}',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: store.increment,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ),
  );
}}
