import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/app/app.dart';
import 'package:wallet/providers/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
