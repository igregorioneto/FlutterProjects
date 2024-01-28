import 'package:dio/dio.dart';
import 'package:github_users/app/data/models/user_model.dart';

class GithubRepository {
  final Dio dio;

  GithubRepository({required this.dio});

  Future<List<UserModel>> getGithubUsers() async {
    final result = await dio.get('https://api.github.com/users');

    final List<UserModel> users = [];

    if (result.statusCode == 200) {
      result.data.map(
        (item) => users.add(
          UserModel.fromJson(item),
        ),
      ).toList();
    }

    return users;
  }

  Future<UserModel> getGithubUserDetail({required String login}) async {
    final result = await dio.get('https://api.github.com/users/$login');

    late UserModel user;

    if (result.statusCode == 200) {
      user = UserModel.fromJson(result.data);
    }

    return user;
  }
}
