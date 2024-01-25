import 'package:flutter/material.dart';
import 'package:tetris_game/app/widgets/pixel.dart';

class GameBoardPage extends StatefulWidget {
  const GameBoardPage({super.key});

  @override
  State<GameBoardPage> createState() => _GameBoardPageState();
}

class _GameBoardPageState extends State<GameBoardPage> {
  // grid dimensions
  int rowLength = 10;
  int colLength = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GridView.builder(
        itemCount: rowLength * colLength,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: rowLength,
        ),
        itemBuilder: (context, index) => Center(
          child: Pixel(
            color: Colors.grey[900],
            child: index,
          ),
        ),
      ),
    );
  }
}
