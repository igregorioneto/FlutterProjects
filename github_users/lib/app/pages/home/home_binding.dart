import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:github_users/app/data/repositories/github_repository.dart';
import 'package:github_users/app/pages/home/home_controller.dart';

setUpHome() {
  Get.put<HomeController>(
    HomeController(
      repository: GithubRepository(
        dio: Dio(),
      ),
    ),
  );
}
