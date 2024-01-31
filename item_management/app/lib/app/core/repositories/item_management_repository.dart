import 'package:app/app/core/models/item.dart';
import 'package:app/app/core/repositories/mock.dart';
import 'package:dio/dio.dart';

class ItemManagementRepository {
  final Dio dio;

  ItemManagementRepository({required this.dio});

  // Simulation api
  Future<List<Item>> getItemManagementListMock() async {
    try {
      List<Item> items = mockData.map((item) => Item.fromJson(item)).toList();
      return items;
    } catch (e) {
      throw Exception('Failed to load itens.');
    }
  }

  // return for repository
  Future<List<Item>> getItemManagementList() async {
    return getItemManagementListMock();
  }
}
