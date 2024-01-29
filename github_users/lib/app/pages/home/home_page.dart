import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_users/app/data/repositories/github_repository.dart';
import 'package:github_users/app/pages/detail/detail_page.dart';
import 'package:github_users/app/pages/home/home_binding.dart';
import 'package:github_users/app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();

    /*_controller = HomeController(
      repository: GithubRepository(
        dio: Dio(),
      ),
    );*/
    setUpHome();
    _controller = Get.find();
    _controller.getGithubUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Users'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return _controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _controller.users.isEmpty
                  ? Center(
                      child: Text('Nenhum usuário encontrado'),
                    )
                  : ListView.separated(
                      itemCount: _controller.users.length,
                      separatorBuilder: (_, __) => Divider(),
                      itemBuilder: (context, index) {
                        final user = _controller.users[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 50,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(user.avatarUrl),
                              ),
                            ),
                          ),
                          title: Text(
                            'user',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          subtitle: Text(
                            user.login,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Get.to(DetailPage(login: user.login));
                          },
                        );
                      },
                    );
        },
      ),
    );
  }
}
