import 'package:flutter/material.dart';
part 'color_schemes.g.dart';

ThemeData get lightTheme => ThemeData(
  useMaterial3: true,
  colorScheme: _lightColorScheme,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: _lightColorScheme.onPrimary,
      fontSize: 18,
    ),
    color: _lightColorScheme.onPrimary,
  ),
  cardColor: _lightColorScheme.onSecondary,
  backgroundColor: _lightColorScheme.onPrimary,
  iconTheme: IconThemeData(color: _lightColorScheme.secondary),
  buttonTheme: ButtonThemeData(colorScheme: ColorScheme.fromSwatch(backgroundColor: _lightColorScheme.secondary)),
  textTheme: TextTheme(headline5: TextStyle(color: _lightColorScheme.onPrimary)),
);

ThemeData get darkTheme => ThemeData(
  useMaterial3: true,
  colorScheme: _darkColorScheme,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: _darkColorScheme.onPrimary,
      fontSize: 18,
    ),
    color: _darkColorScheme.onPrimary,
  ),
  cardColor: _darkColorScheme.onSecondary,
  backgroundColor: _darkColorScheme.onPrimary,
  iconTheme: IconThemeData(color: _darkColorScheme.secondary),
  buttonTheme: ButtonThemeData(colorScheme: ColorScheme.fromSwatch(backgroundColor: _darkColorScheme.secondary)),
  textTheme: TextTheme(headline5: TextStyle(color: _darkColorScheme.onPrimary)),
);