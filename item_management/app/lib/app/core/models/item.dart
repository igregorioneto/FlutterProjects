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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'numeration': numeration,
      'order': order,
      'lot': lot,
      'barcode': barcode,
      'quantity': quantity,
      'status': status,
      'storage_area': storageArea,
    };
  }

  Item copyWith({
    int? id,
    String? name,
    int? numeration,
    int? order,
    String? lot,
    String? barcode,
    double? quantity,
    String? status,
    bool? storageArea,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      numeration: numeration ?? this.numeration,
      order: order ?? this.order,
      lot: lot ?? this.lot,
      barcode: barcode ?? this.barcode,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      storageArea: storageArea ?? this.storageArea,
    );
  }
}
