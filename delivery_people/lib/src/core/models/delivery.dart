import 'package:delivery_people/src/core/enums/status_delivery.dart';
import 'package:delivery_people/src/core/models/address.dart';
import 'package:delivery_people/src/core/models/user.dart';

class Delivery {
  final String? id;
  final int estimatedTime;
  final double deliveryValue;
  final Address collect;
  final Address delivery;
  final StatusDelivery statusDelivery;
  final User user;

  Delivery({
    required this.id,
    required this.estimatedTime,
    required this.deliveryValue,
    required this.collect,
    required this.delivery,
    required this.statusDelivery,
    required this.user,
  });

  Delivery.fromJson(Map json)
      : id = json['id'],
        estimatedTime = json['estimated_time'],
        deliveryValue = json['delivery_value'],
        collect = json['collect'],
        delivery = json['delivery'],
        statusDelivery = json['status_delivery'],
        user = json['user'];
}
