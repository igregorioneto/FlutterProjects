class Item {
  final int? id;
  late final String name;
  late final int numeration;
  late final int order;
  late final String lot;
  late final String barcode;
  late final double quantity;
  late final String status;
  late final bool storageArea;

  Item({
    this.id,
    required this.name,
    required this.numeration,
    required this.order,
    required this.lot,
    required this.barcode,
    required this.quantity,
    required this.status,
    required this.storageArea,
  });

  Item.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        numeration = json['numeration'],
        order = json['order'],
        lot = json['lot'],
        barcode = json['barcode'],
        quantity = json['quantity'],
        status = json['status'],
        storageArea = json['storage_area'];
}
