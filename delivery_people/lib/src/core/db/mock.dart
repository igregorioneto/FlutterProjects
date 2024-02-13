import 'package:delivery_people/src/core/enums/status_delivery.dart';
import 'package:delivery_people/src/core/enums/type_delivery.dart';
import 'package:delivery_people/src/core/models/address.dart';
import 'package:delivery_people/src/core/models/delivery.dart';
import 'package:delivery_people/src/core/models/user.dart';

List<Map<String, dynamic>> mockUsers = [
  {"id": "1", "email": "user1@example.com", "password": "password1"},
  {"id": "2", "email": "user2@example.com", "password": "password2"},
  {"id": "3", "email": "user3@example.com", "password": "password3"},
  {"id": "4", "email": "user4@example.com", "password": "password4"},
  {"id": "5", "email": "user5@example.com", "password": "password5"}
];

List<Map<String, dynamic>> mockDeliveries = [
  {
    "id": "1",
    "estimated_time": 30,
    "delivery_value": 10.0,
    "collect": {"id": "1", "local": "Endereço de coleta 1", "type": "Coleta"},
    "delivery": {
      "id": "2",
      "local": "Endereço de entrega 1",
      "type": "Entrega"
    },
    "status_delivery": "Accepted",
    "user": {"id": "1", "email": "user1@example.com", "password": "password1"}
  },
  {
    "id": "2",
    "estimated_time": 45,
    "delivery_value": 15.0,
    "collect": {"id": "3", "local": "Endereço de coleta 2", "type": "Coleta"},
    "delivery": {
      "id": "4",
      "local": "Endereço de entrega 2",
      "type": "Entrega"
    },
    "status_delivery": "Rejected",
    "user": {"id": "2", "email": "user2@example.com", "password": "password2"}
  },
  {
    "id": "3",
    "estimated_time": 60,
    "delivery_value": 20.0,
    "collect": {"id": "5", "local": "Endereço de coleta 3", "type": "Coleta"},
    "delivery": {
      "id": "6",
      "local": "Endereço de entrega 3",
      "type": "Entrega"
    },
    "status_delivery": "NotLinked",
    "user": {"id": "3", "email": "user3@example.com", "password": "password3"}
  },
  {
    "id": "4",
    "estimated_time": 25,
    "delivery_value": 12.0,
    "collect": {"id": "7", "local": "Endereço de coleta 4", "type": "Coleta"},
    "delivery": {
      "id": "8",
      "local": "Endereço de entrega 4",
      "type": "Entrega"
    },
    "status_delivery": "Accepted",
    "user": {"id": "3", "email": "user3@example.com", "password": "password3"}
  },
  {
    "id": "5",
    "estimated_time": 35,
    "delivery_value": 18.0,
    "collect": {"id": "9", "local": "Endereço de coleta 5", "type": "Coleta"},
    "delivery": {
      "id": "10",
      "local": "Endereço de entrega 5",
      "type": "Entrega"
    },
    "status_delivery": "NotLinked",
    "user": {"id": "3", "email": "user3@example.com", "password": "password3"}
  },
  {
    "id": "6",
    "estimated_time": 40,
    "delivery_value": 22.0,
    "collect": {"id": "11", "local": "Endereço de coleta 6", "type": "Coleta"},
    "delivery": {
      "id": "12",
      "local": "Endereço de entrega 6",
      "type": "Entrega"
    },
    "status_delivery": "Accepted",
    "user": {"id": "4", "email": "user4@example.com", "password": "password4"}
  },
  {
    "id": "7",
    "estimated_time": 50,
    "delivery_value": 25.0,
    "collect": {"id": "13", "local": "Endereço de coleta 7", "type": "Coleta"},
    "delivery": {
      "id": "14",
      "local": "Endereço de entrega 7",
      "type": "Entrega"
    },
    "status_delivery": "Rejected",
    "user": {"id": "5", "email": "user5@example.com", "password": "password5"}
  },
  {
    "id": "8",
    "estimated_time": 55,
    "delivery_value": 30.0,
    "collect": {"id": "15", "local": "Endereço de coleta 8", "type": "Coleta"},
    "delivery": {
      "id": "16",
      "local": "Endereço de entrega 8",
      "type": "Entrega"
    },
    "status_delivery": "Accepted",
    "user": {"id": "1", "email": "user1@example.com", "password": "password1"}
  },
  {
    "id": "9",
    "estimated_time": 20,
    "delivery_value": 8.0,
    "collect": {"id": "17", "local": "Endereço de coleta 9", "type": "Coleta"},
    "delivery": {
      "id": "18",
      "local": "Endereço de entrega 9",
      "type": "Entrega"
    },
    "status_delivery": "NotLinked",
    "user": {"id": "4", "email": "user4@example.com", "password": "password4"}
  },
  {
    "id": "10",
    "estimated_time": 65,
    "delivery_value": 35.0,
    "collect": {"id": "19", "local": "Endereço de coleta 10", "type": "Coleta"},
    "delivery": {
      "id": "20",
      "local": "Endereço de entrega 10",
      "type": "Entrega"
    },
    "status_delivery": "Accepted",
    "user": {"id": "2", "email": "user2@example.com", "password": "password2"}
  }
];
