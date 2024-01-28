import 'package:get/get.dart';
import 'package:github_users/app/data/models/user_model.dart';
import 'package:github_users/app/data/repositories/github_repository.dart';

class DetailController {
  final GithubRepository repository;

  UserModel? _user;
  UserModel? get user => _user;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  DetailController({required this.repository});

  getGithubUserDetail({required String login}) async {
    _isLoading.value = true;
    _user = await repository.getGithubUserDetail(login: login);
    _isLoading.value = false;
  }
}