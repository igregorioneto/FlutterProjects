import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:github_users/app/data/repositories/github_repository.dart';
import 'package:github_users/app/pages/detail/detail_controller.dart';

setUpDetail() {
  Get.put<DetailController>(
    DetailController(
      repository: GithubRepository(
        dio: Dio(),
      ),
    ),
  );
}
