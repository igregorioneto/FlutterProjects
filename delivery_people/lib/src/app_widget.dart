import 'package:delivery_people/src/pages/login/login_page.dart';
import 'package:delivery_people/src/pages/overview/overview_page.dart';
import 'package:delivery_people/src/pages/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery People',
      home: SplashScreenPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/overview': (context) => OverviewPage(),
      },
    );
  }
}
