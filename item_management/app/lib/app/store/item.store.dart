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

    final fetchedItems = await repository.getItemManagementList();
    items = ObservableList.of(fetchedItems);
    itemsFilter = ObservableList.of(items);
    weightItems = ItemService.weightItems(itemsFilter);

    isLoading = false;
  }

  /*
  * Filter items Receiving
  * */
  @action
  Future<void> fetchItemsReceiving() async {
    isLoading = true;

    List<Item> filteredList = items.where((item) => item.status == 'Receiving').toList();
    itemsFilter.clear();
    itemsFilter = ObservableList.of(filteredList);
    weightItems = ItemService.weightItems(itemsFilter);

    isLoading = false;
  }

  /*
  * Filter items Quarantine
  * */
  @action
  Future<void> fetchItemsQuarantine() async {
    isLoading = true;

    List<Item> filteredList = items.where((item) => item.status == 'Quarantine').toList();
    itemsFilter.clear();
    itemsFilter = ObservableList.of(filteredList);
    weightItems = ItemService.weightItems(itemsFilter);

    isLoading = false;
  }
}
