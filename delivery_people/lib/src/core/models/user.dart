class User {
  final String? id;
  final String email;
  final String password;

  User({this.id, required this.email, required this.password});

  User.fromJson(Map json)
      : id = json['id'],
        email = json['email'],
        password = json['password'];
}
