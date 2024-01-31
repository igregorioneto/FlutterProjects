class Item {
  final int? id;
  final String name;
  final int numeration;
  final int order;
  final String lot;
  final String barcode;
  final double quantity;
  final String status;

  Item({
    this.id,
    required this.name,
    required this.numeration,
    required this.order,
    required this.lot,
    required this.barcode,
    required this.quantity,
    required this.status,
  });

  Item.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        numeration = json['numeration'],
        order = json['order'],
        lot = json['lot'],
        barcode = json['barcode'],
        quantity = json['quantity'],
        status = json['status'];
}
