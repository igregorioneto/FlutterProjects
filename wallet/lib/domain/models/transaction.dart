class Transaction {
  final String type;
  final int amount;
  final DateTime timestamp;

  Transaction({
    required this.type,
    required this.amount,
    required this.timestamp,
  });
}
