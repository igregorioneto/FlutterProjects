import 'package:wallet/domain/models/transaction.dart';

class TransactionService {
  Future<List<Transaction>> getMockedTransactions() async {
    await Future.delayed(Duration(seconds: 2));

    return List.generate(5, (index) {
      final type = index.isEven ? 'Transfer' : 'Payment';
      final amount = (index + 1) * 1000;
      final timestamp = DateTime.now().subtract(Duration(minutes: index * 30));

      return Transaction(
        type: type,
        amount: amount,
        timestamp: timestamp,
      );
    });
  }
}
