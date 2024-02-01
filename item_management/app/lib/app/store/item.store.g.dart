// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemStore on _ItemStore, Store {
  late final _$itemsAtom = Atom(name: '_ItemStore.items', context: context);

  @override
  ObservableList<Item> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<Item> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$itemsFilterAtom =
      Atom(name: '_ItemStore.itemsFilter', context: context);

  @override
  ObservableList<Item> get itemsFilter {
    _$itemsFilterAtom.reportRead();
    return super.itemsFilter;
  }

  @override
  set itemsFilter(ObservableList<Item> value) {
    _$itemsFilterAtom.reportWrite(value, super.itemsFilter, () {
      super.itemsFilter = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ItemStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$weightItemsAtom =
      Atom(name: '_ItemStore.weightItems', context: context);

  @override
  double get weightItems {
    _$weightItemsAtom.reportRead();
    return super.weightItems;
  }

  @override
  set weightItems(double value) {
    _$weightItemsAtom.reportWrite(value, super.weightItems, () {
      super.weightItems = value;
    });
  }

  late final _$isSorteAscendingAtom =
      Atom(name: '_ItemStore.isSorteAscending', context: context);

  @override
  bool get isSorteAscending {
    _$isSorteAscendingAtom.reportRead();
    return super.isSorteAscending;
  }

  @override
  set isSorteAscending(bool value) {
    _$isSorteAscendingAtom.reportWrite(value, super.isSorteAscending, () {
      super.isSorteAscending = value;
    });
  }

  late final _$fetchItemsAsyncAction =
      AsyncAction('_ItemStore.fetchItems', context: context);

  @override
  Future<void> fetchItems() {
    return _$fetchItemsAsyncAction.run(() => super.fetchItems());
  }

  late final _$fetchItemsReceivingAsyncAction =
      AsyncAction('_ItemStore.fetchItemsReceiving', context: context);

  @override
  Future<void> fetchItemsReceiving() {
    return _$fetchItemsReceivingAsyncAction
        .run(() => super.fetchItemsReceiving());
  }

  late final _$fetchItemsQuarantineAsyncAction =
      AsyncAction('_ItemStore.fetchItemsQuarantine', context: context);

  @override
  Future<void> fetchItemsQuarantine() {
    return _$fetchItemsQuarantineAsyncAction
        .run(() => super.fetchItemsQuarantine());
  }

  @override
  String toString() {
    return '''
items: ${items},
itemsFilter: ${itemsFilter},
isLoading: ${isLoading},
weightItems: ${weightItems},
isSorteAscending: ${isSorteAscending}
    ''';
  }
}
