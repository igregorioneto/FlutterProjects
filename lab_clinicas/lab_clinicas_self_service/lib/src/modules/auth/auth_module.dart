import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service/src/modules/auth/login/login_page.dart';
import 'package:lab_clinicas_self_service/src/repositories/user/user_repository.dart';
import 'package:lab_clinicas_self_service/src/repositories/user/user_repository_impl.dart';

class AuthModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(restClient: i())),
  ];

  @override
  String get moduleRouteName => '/auth';

  @override
  // TODO: implement pages
  Map<String, WidgetBuilder> get pages => {
    '/login': (_) => const LoginPage(),
  };

}