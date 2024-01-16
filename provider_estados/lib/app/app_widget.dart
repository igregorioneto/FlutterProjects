import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_estados/app/app_store.dart';
import 'package:provider_estados/app/pages/home_page.dart';
import 'package:provider_estados/app/shared/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppStore(),
      child: Consumer<AppStore>(
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Flutter Provider',
            themeMode: value.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
