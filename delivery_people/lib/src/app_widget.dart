import 'package:delivery_people/src/core/models/delivery.dart';
import 'package:delivery_people/src/core/repositories/delivery_repository.dart';
import 'package:delivery_people/src/core/repositories/user_repository.dart';
import 'package:delivery_people/src/pages/home/home_page.dart';
import 'package:delivery_people/src/pages/login/login_page.dart';
import 'package:delivery_people/src/pages/overview/overview_page.dart';
import 'package:delivery_people/src/pages/profile/profile_page.dart';
import 'package:delivery_people/src/pages/report/report_page.dart';
import 'package:delivery_people/src/pages/splash_screen/splash_screen_page.dart';
import 'package:delivery_people/src/store/delivery/delivery.store.dart';
import 'package:delivery_people/src/store/user/user.store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MultiProvider(
      providers: [
        Provider<UserRepository>(
          create: (_) => UserRepository(dio: Dio()),
        ),
        Provider<DeliveryRepository>(
          create: (_) => DeliveryRepository(dio: Dio()),
        ),
        Provider<UserStore>(
          create: (context) =>
              UserStore(repository: UserRepository(dio: Dio())),
        ),
        Provider<DeliveryStore>(
          create: (context) =>
              DeliveryStore(repository: DeliveryRepository(dio: Dio())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delivery People',
        home: SplashScreenPage(),
        routes: {
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
