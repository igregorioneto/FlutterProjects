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

  // Updating item
  Future<void> updatingItem(Item updateItem) async {
    try {
      int index = mockData.indexWhere((item) => item['id'] == updateItem.id);
      if (index != -1) {
        mockData[index] = updateItem.toJson();
      } else {
        throw Exception('Item not found for update.');
      }
    } catch(e) {
      throw Exception('Failed to update item.');
    }
  }

  // return for repository
  Future<List<Item>> getItemManagementList() async {
    return getItemManagementListMock();
  }
}
