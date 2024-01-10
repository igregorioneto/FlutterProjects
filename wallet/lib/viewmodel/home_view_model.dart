import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wallet/services/chart_service.dart';

class HomeViewModel {
  final _chartService = ChartService();

  Future<LineChartData> fetchChartData(bool isLoaded) async {
    await Future.delayed(Duration(seconds: 2));
    return _chartService.mainData(true);
  }
}