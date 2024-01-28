import 'package:get/get.dart';
import 'package:github_users/app/data/models/user_model.dart';
import 'package:github_users/app/data/repositories/github_repository.dart';

class HomeController extends GetxController {
  final GithubRepository repository;

  // Users observable
  final List<UserModel> _users = <UserModel>[].obs;
  List<UserModel> get users => _users;

  // is loading observable
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  HomeController({required this.repository});

  getGithubUsers() async {
    _isLoading.value = true;
    final response = await repository.getGithubUsers();

    _users.addAll(response);

    _isLoading.value = false;
  }
}