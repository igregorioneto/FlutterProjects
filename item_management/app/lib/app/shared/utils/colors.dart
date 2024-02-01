import 'package:flutter/material.dart';

final quarentineColor = Color(Colors.orange.value);
final quarentineBackground = Color(Colors.orange!.value);

final receivingColor = Color(Colors.blue.value);
final receivingBackground = Color(Colors.blue!.value);

final storageColor = Color(Colors.green.value);
final storagesBackground = Color(Colors.green!.value);

Color goTypeColor(String type) {
  return type == 'Receiving'
      ? Color(Colors.orange.value)
      : type == 'Quarantine'
      ? Color(Colors.green.value)
      : Color(Colors.blue.value);
}