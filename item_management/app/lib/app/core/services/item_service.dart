import 'package:app/app/core/models/item.dart';

class ItemService {
  
  static double weightItems(List<Item> items) {
    double calc = 0;
    items.forEach((e) {
      calc += e.quantity;
    });
    return calc;
  }
  
}