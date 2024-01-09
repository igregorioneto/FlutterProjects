import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.blueGrey),
    textTheme: TextTheme(headline5: TextStyle(color: Colors.blueGrey)),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
    ),
    primaryColor: Colors.white,
  );

  static ThemeData dark = ThemeData(
    backgroundColor: Colors.black54,
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(headline5: TextStyle(color: Colors.white)),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    ),
    primaryColor: Colors.white,
  );
}
