import 'package:app/app/core/repositories/item_management_repository.dart';
import 'package:app/app/features/home/home_page.dart';
import 'package:app/app/store/item.store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          Provider<ItemManagementRepository>(
            create: (_) => ItemManagementRepository(dio: Dio()),
          ),
          Provider<ItemStore>(
            create: (context) =>
                ItemStore(repository: ItemManagementRepository(dio: Dio())),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
