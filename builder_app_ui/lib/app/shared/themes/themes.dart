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
);