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
  bool isLoading = false;

  @observable
  double weightItems = 0;

  @action
  Future<void> fetchItems() async {
    isLoading = true;
    final fetchedItems = await repository.getItemManagementList();
    items.clear();
    items.addAll(fetchedItems);
    weightItems = ItemService.weightItems(items);
    isLoading = false;
  }
}
