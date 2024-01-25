import 'package:flutter/material.dart';
import 'package:tetris_game/app/pages/game_board_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameBoardPage(),
    );
  }
}
