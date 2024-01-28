import 'dart:convert';

class UserModel {
  late String login;
  late String avatarUrl;
  late String? location;
  late String? name;
  late int? followers;
  late int? publicRepos;

  UserModel({
    required this.login,
    required this.avatarUrl,
    this.location,
    this.name,
    this.followers,
    this.publicRepos,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
      login = json['login'];
      avatarUrl = json['avatar_url'];
      location = json['location'];
      name = json['name'];
      followers = json['followers'];
      publicRepos = json['public_repos'];
  }
}
