import 'package:flutter/material.dart';
import 'package:tetris_game/app/game/constants.dart';
import 'package:tetris_game/app/game/piece.dart';
import 'package:tetris_game/app/game/tetromino.dart';
import 'package:tetris_game/app/widgets/pixel.dart';

class GameBoardPage extends StatefulWidget {
  const GameBoardPage({super.key});

  @override
  State<GameBoardPage> createState() => _GameBoardPageState();
}

class _GameBoardPageState extends State<GameBoardPage> {

  // current tetris piece
  Piece currentPiece = Piece(type: Tetromino.L);

  @override
  void initState() {
    super.initState();

    startGame();
  }

  void startGame() {
    currentPiece.initializePiece();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GridView.builder(
        itemCount: Constants.rowLength * Constants.colLength,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Constants.rowLength,
        ),
        itemBuilder: (context, index) {
          if (currentPiece.position.contains(index)) {
            return Center(
              child: Pixel(
                color: Colors.yellow,
                child: index,
              ),
            );
          } else {
            return Center(
              child: Pixel(
                color: Colors.grey[900],
                child: index,
              ),
            );
          }
        }
      ),
    );
  }
}
