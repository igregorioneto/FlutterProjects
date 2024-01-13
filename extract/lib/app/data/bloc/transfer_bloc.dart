import 'dart:async';

import 'package:extract/app/data/bloc/transfer_event.dart';
import 'package:extract/app/data/bloc/transfer_state.dart';
import 'package:extract/app/data/models/transfer_model.dart';
import 'package:extract/app/data/repositories/transfer_repository.dart';

class TransferBloc {
  final _repository = TransferRepository();

  final StreamController<TransferEvent> _inputTransferController =
  StreamController<TransferEvent>();

  final StreamController<TransferState> _outputTransferController =
  StreamController<TransferState>();

  Sink<TransferEvent> get inputTransfer => _inputTransferController.sink;
  Stream<TransferState> get outputTransfer => _outputTransferController.stream;

  TransferBloc() {
    _inputTransferController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TransferEvent event) async {
    List<Transfer> transfers = [];

    _outputTransferController.add(TransferLoadingState());
    
    if (event is GetTransfers) {
      transfers = await _repository.getTransfers();
    }

    _outputTransferController.add(TransferLoadedState(transfers: transfers));
  }
}



