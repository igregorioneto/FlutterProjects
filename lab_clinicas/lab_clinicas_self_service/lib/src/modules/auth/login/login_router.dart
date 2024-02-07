import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service/src/modules/auth/login/login_controller.dart';
import 'package:lab_clinicas_self_service/src/modules/auth/login/login_page.dart';
import 'package:lab_clinicas_self_service/src/repositories/user/user_repository.dart';
import 'package:lab_clinicas_self_service/src/repositories/user/user_repository_impl.dart';
import 'package:lab_clinicas_self_service/src/services/user_login_service.dart';
import 'package:lab_clinicas_self_service/src/services/user_login_service_impl.dart';

class LoginRouter extends FlutterGetItModulePageRouter {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserLoginService>(
            (i) => UserLoginServiceImpl(userRepository: i())),
        Bind.lazySingleton((i) => LoginController()),
      ];

  @override
  WidgetBuilder get view => (_) => const LoginPage();
}
