import 'package:delivery_people/src/core/enums/type_delivery.dart';

extension TypeDeliveryExtension on TypeDelivery {
  String get type {
    switch(this) {
      case TypeDelivery.Coleta:
        return 'coleta';
      case TypeDelivery.Entrega:
        return 'entrega';
    }
  }
}