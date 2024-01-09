import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/providers/theme_provider.dart';
import 'package:wallet/screens/home_page.dart';
import 'package:wallet/util/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.darkTheme ? AppTheme.dark : AppTheme.light,
      home: HomePage(),
    );
  }
}
