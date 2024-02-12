import 'package:delivery_people/src/core/db/mock.dart';
import 'package:delivery_people/src/core/models/user.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  late Dio dio;

  UserRepository({required this.dio});

  // Login user
  Future<bool> login(String email, String password) async {
    try {
      // Procura usuário na lista de mocks
      Map<String, dynamic> userData = mockUsers
          .firstWhere((user) => user['email'] == email);
      if (userData != null) {
        User user = User.fromJson(userData);
        if (user.password == password) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('user_email', user.email);
          return true;
        } else {
          return false;
        }
      }
      return false;
    } on StateError {
      return false;
    } catch (e) {
      throw Exception('Error when logging in: ${e}');
    }
  }

  Future<bool> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString('user_email') != '') {
        prefs.setString('user_email', '');
        return true;
      } else {
        return false;
      }
    } on StateError {
      return false;
    } catch (e) {
      throw Exception('Not logged out');
    }
  }
}
