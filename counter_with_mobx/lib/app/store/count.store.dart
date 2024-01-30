import 'package:mobx/mobx.dart';

part 'count.store.g.dart';

class CounterStore = _CountStore with _$CounterStore;

abstract class _CountStore with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }
}
