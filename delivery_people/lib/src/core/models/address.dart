import 'package:delivery_people/src/core/enums/type_delivery.dart';

class Address {
  final String? id;
  final String local;
  final TypeDelivery type;

  Address({
    required this.id,
    required this.local,
    required this.type,
  });

  Address.fromJson(Map json)
      : id = json['id'],
        local = json['local'],
        type = json['type'];
}
