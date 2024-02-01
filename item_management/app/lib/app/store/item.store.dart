import 'dart:async';

import 'package:app/app/core/models/item.dart';
import 'package:app/app/core/repositories/item_management_repository.dart';
import 'package:app/app/core/services/item_service.dart';
import 'package:app/app/shared/utils/titles.dart';
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

  @observable
  bool isSorteAscending = true;

  // Observables Advanced Filter
  @observable
  String selectedStatusFilter = 'Todos';
  int selectedOrderFilter = 0;
  int selectedNumerationFilter = 0;
  bool resetFilter = false;

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

    List<Item> filteredList =
        items.where((item) => item.status == 'Receiving').toList();
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

    List<Item> filteredList =
        items.where((item) => item.status == 'Quarantine').toList();
    itemsFilter.clear();
    itemsFilter = ObservableList.of(filteredList);
    weightItems = ItemService.weightItems(itemsFilter);

    isLoading = false;
  }

  /*
  * Ordenation Item by name
  * */
  Future<void> fetchOrdenationItensByName() async {
    isSorteAscending = !isSorteAscending;

    itemsFilter.sort(
      (a, b) {
        if (isSorteAscending) {
          return a.name.compareTo(b.name);
        } else {
          return b.name.compareTo(a.name);
        }
      },
    );
  }

  /*
  * Advanced filter
  * */
  Future<void> fetchAdvancedFilter() async {
    isLoading = true;

    List<Item> filteredList = ObservableList.of(items);

    if (selectedStatusFilter != 'Todos') {
      final status = titlesStatusTypeItemForFilter(selectedStatusFilter);
      filteredList = filteredList.where((item) => item.status == status).toList();
    }

    if (selectedOrderFilter != 0) {
      filteredList = filteredList.where((item) => item.order == selectedOrderFilter).toList();
    }

    if (selectedNumerationFilter != 0) {
      filteredList = filteredList.where((item) => item.numeration == selectedNumerationFilter).toList();
    }

    if (resetFilter) {
      filteredList = ObservableList.of(items);
    }

    itemsFilter = ObservableList.of(filteredList);
    weightItems = ItemService.weightItems(itemsFilter);

    isLoading = false;
    resetFilter = false;
    selectedStatusFilter = 'Todos';
    selectedNumerationFilter = 0;
    selectedOrderFilter = 0;
  }
}
