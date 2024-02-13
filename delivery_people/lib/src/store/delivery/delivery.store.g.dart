// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeliveryStore on _DeliveryStore, Store {
  late final _$_isLoadingAtom =
      Atom(name: '_DeliveryStore._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_deliveriesAtom =
      Atom(name: '_DeliveryStore._deliveries', context: context);

  @override
  ObservableList<Delivery> get _deliveries {
    _$_deliveriesAtom.reportRead();
    return super._deliveries;
  }

  @override
  set _deliveries(ObservableList<Delivery> value) {
    _$_deliveriesAtom.reportWrite(value, super._deliveries, () {
      super._deliveries = value;
    });
  }

  late final _$fetchDeliveriesAsyncAction =
      AsyncAction('_DeliveryStore.fetchDeliveries', context: context);

  @override
  Future<void> fetchDeliveries() {
    return _$fetchDeliveriesAsyncAction.run(() => super.fetchDeliveries());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
