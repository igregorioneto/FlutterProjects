import 'dart:async';

import 'package:app/app/core/models/item.dart';
import 'package:app/app/core/repositories/item_management_repository.dart';
import 'package:app/app/core/services/item_service.dart';
import 'package:mobx/mobx.dart';

part 'item.store.g.dart';

class ItemStore = _ItemStore with _$ItemStore;

abstract class _ItemStore with Store {
  final ItemManagementRepository repository;

  _ItemStore({required this.repository});

  @observable
  ObservableList<Item> items = ObservableList();

  @observable
  ObservableList<Item> itemsFilter = ObservableList();

  @observable
  bool isLoading = false;

  @observable
  double weightItems = 0;

  /*
  * List Items and Weight Items
  * */
  @action
  Future<void> fetchItems() async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 2));

    final fetchedItems = await repository.getItemManagementList();
    items.clear();
    items.addAll(fetchedItems);
    itemsFilter = ObservableList.of(items);
    weightItems = ItemService.weightItems(items);
    isLoading = false;
  }

  /*
  * Filter items Receiving
  * */
  @action
  Future<void> fetchItemsReceiving() async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 2));

    List<Item> originalList = List.from(items);
    List<Item> filteredList = originalList.where((item) => item.status == 'Receiving').toList();
    itemsFilter = ObservableList.of(filteredList);

    isLoading = false;
  }

  /*
  * Filter items Quarantine
  * */
  @action
  Future<void> fetchItemsQuarantine() async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 2));

    List<Item> originalList = List.from(items);
    List<Item> filteredList = originalList.where((item) => item.status == 'Quarantine').toList();
    itemsFilter = ObservableList.of(filteredList);

    isLoading = false;
  }
}
