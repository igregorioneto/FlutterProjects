import 'package:delivery_people/src/core/models/delivery.dart';
import 'package:delivery_people/src/core/repositories/delivery_repository.dart';
import 'package:mobx/mobx.dart';

part 'delivery.store.g.dart';

class DeliveryStore = _DeliveryStore with _$DeliveryStore;

abstract class _DeliveryStore with Store {
  DeliveryRepository repository;

  _DeliveryStore({required this.repository});

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @observable
  ObservableList<Delivery> _deliveries = ObservableList();
  ObservableList<Delivery> get deliveries => _deliveries;

  @action
  Future<void> fetchDeliveries() async {
    _isLoading = true;
    Future.delayed(Duration(seconds: 2));
    final fetchItems = await repository.fetchDelivery();
    if (fetchItems != null) {
      _deliveries = ObservableList.of(fetchItems);
    }
    _isLoading = false;
  }
}