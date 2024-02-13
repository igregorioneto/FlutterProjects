import 'package:delivery_people/src/core/db/mock.dart';
import 'package:delivery_people/src/core/models/delivery.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryRepository {
  final Dio dio;

  DeliveryRepository({required this.dio});

  Future<List<Delivery>?> fetchDelivery() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userEmail = prefs.getString('user_email') ?? '';
      print(userEmail);
      if (userEmail != '') {
        Iterable<Map<String, dynamic>> deliveryData = mockDeliveries.where((
            d) => d['user']['email'] == userEmail);

        List<Delivery> deliveries = deliveryData.map((data) => Delivery.fromJson(data)).toList();
        return deliveries;
      }
      return null;
    } catch (e, s) {
      print('Error find delivery: $e');
      print(s);
      throw Exception('Error find delivery: $e');
    }
  }

}