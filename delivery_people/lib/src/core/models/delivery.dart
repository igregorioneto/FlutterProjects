import 'package:delivery_people/src/core/enums/status_delivery.dart';
import 'package:delivery_people/src/core/models/address.dart';

class Delivery {
  final String? id;
  final int estimatedTime;
  final double deliveryValue;
  final Address address;
  final StatusDelivery statusDelivery;

  Delivery({
    required this.id,
    required this.estimatedTime,
    required this.deliveryValue,
    required this.address,
    required this.statusDelivery,
  });

  Delivery.fromJson(Map json)
      : id = json['id'],
        estimatedTime = json['estimated_time'],
        deliveryValue = json['delivery_value'],
        address = json['address'],
        statusDelivery = json['status_delivery'];
}
