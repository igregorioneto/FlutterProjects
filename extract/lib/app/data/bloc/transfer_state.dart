import 'package:extract/app/data/models/transfer_model.dart';

abstract class TransferState {
  final List<Transfer> transfers;

  TransferState({required this.transfers});
}

class TransferInitialState extends TransferState {
  TransferInitialState() : super(transfers: []);
}

class TransferLoadingState extends TransferState {
  TransferLoadingState() : super(transfers: []);
}

class TransferLoadedState extends TransferState {
  TransferLoadedState({required List<Transfer> transfers}) : super(transfers: transfers);
}

class TransferErrorState extends TransferState {
  final Exception exception;

  TransferErrorState({required this.exception}) : super(transfers: []);
}