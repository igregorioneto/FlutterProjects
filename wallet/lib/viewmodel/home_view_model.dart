import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wallet/domain/models/transaction.dart';
import 'package:wallet/services/chart_service.dart';
import 'package:wallet/services/transaction_service.dart';

class HomeViewModel {
  final _chartService = ChartService();
  final _transactionService = TransactionService();

  Future<LineChartData> fetchChartData(bool isLoaded) async {
    await Future.delayed(Duration(seconds: 2));
    return _chartService.mainData(true);
  }

  Future<List<Transaction>> fetchTransactionData() async {
    return await _transactionService.getMockedTransactions();
  }
}