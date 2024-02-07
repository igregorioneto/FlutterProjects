import 'package:delivery_people/src/pages/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery People',
      home: SplashScreenPage(),
    );
  }
}
