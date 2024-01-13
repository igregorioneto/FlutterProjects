class Transfer {
  final String type;
  final String from;
  final String value;
  final String date;

  Transfer({
    required this.type,
    required this.from,
    required this.value,
    required this.date,
  });

  Transfer.fromJson(Map json)
      : type = json['type'],
        from = json['from'],
        value = json['value'],
        date = json['date'];
}
