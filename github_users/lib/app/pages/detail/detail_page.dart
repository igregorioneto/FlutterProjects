import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_users/app/data/repositories/github_repository.dart';
import 'package:github_users/app/pages/detail/detail_controller.dart';

class DetailPage extends StatefulWidget {
  final String login;

  const DetailPage({
    super.key,
    required this.login,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DetailController _controller;

  @override
  void initState() {
    super.initState();

    _controller = DetailController(
      repository: GithubRepository(
        dio: Dio(),
      ),
    );

    _controller.getGithubUserDetail(login: widget.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return _controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _controller.user == null
                  ? Center(
                      child: Text('Nenhum usuário encontrado'),
                    )
                  : _buildUserInfo();
        },
      ),
    );
  }

  Widget _buildUserInfo() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              _controller.user!.avatarUrl,
              height: 275,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 32),
          // Name
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.emoji_people_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Name',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.user!.name ?? 'No informations',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Login
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.short_text_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Login',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.user!.login ?? 'No informations',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Repositories Public
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.grain_outlined,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Public Repositories',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.user!.publicRepos.toString() ?? 'No informations',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Followers
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.people_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Followers',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.user!.followers.toString() ?? 'No informations',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Locale
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.flag_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Locale',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.user!.location ?? 'No informations',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
