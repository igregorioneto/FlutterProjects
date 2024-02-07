import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/binding/lab_clinicas_application_binding.dart';
import 'package:lab_clinicas_self_service/src/modules/auth/auth_module.dart';
import 'package:lab_clinicas_self_service/src/pages/splash_screen/splash_screen.dart';

void main() {
  runApp(const LabClinicasSelfServiceApp());
}

class LabClinicasSelfServiceApp extends StatelessWidget {
  const LabClinicasSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: 'Lab Clinicas Auto Atencimento',
      bindings: LabClinicasApplicationBinding(),
      modules: [AuthModule()],
      pagesBuilders: [
        FlutterGetItPageBuilder(
          page: (_) => const SplashScreen(),
          path: '/',
        ),
      ],
    );
  }
}
