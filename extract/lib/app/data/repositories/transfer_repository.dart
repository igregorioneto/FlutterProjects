import 'package:extract/app/data/models/transfer_model.dart';

class TransferRepository {
  final List<Transfer> _transfers = [];

  Future<List<Transfer>> getTransfers() async {
    _transfers.addAll([
      Transfer(type: 'TE', from: 'David Bond', value: '100', date: '13/10'),
      Transfer(type: 'TR', from: 'David Bond', value: '18', date: '10/10'),
      Transfer(type: 'DB', from: 'SC', value: '500', date: '08/10'),
      Transfer(type: 'PIXE', from: 'Michel Skywalker', value: '30', date: '05/10'),
      Transfer(type: 'PIXR', from: 'SC', value: '22', date: '05/10'),
    ]);

    return Future.delayed(
      const Duration(seconds: 2),
        () => _transfers,
    );
  }
}