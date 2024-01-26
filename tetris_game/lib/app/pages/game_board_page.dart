import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris_game/app/game/constants.dart';
import 'package:tetris_game/app/game/direction.dart';
import 'package:tetris_game/app/game/piece.dart';
import 'package:tetris_game/app/game/tetromino.dart';
import 'package:tetris_game/app/widgets/pixel.dart';

List<List<Tetromino?>> gameBoard = List.generate(
  Constants.colLength,
  (i) => List.generate(
    Constants.rowLength,
    (j) => null,
  ),
);

class GameBoardPage extends StatefulWidget {
  const GameBoardPage({super.key});

  @override
  State<GameBoardPage> createState() => _GameBoardPageState();
}

class _GameBoardPageState extends State<GameBoardPage> {
  // current tetris piece
  Piece currentPiece = Piece(type: Tetromino.T);

  @override
  void initState() {
    super.initState();

    startGame();
  }

  // Game Starting
  void startGame() {
    // Initialize Piece
    currentPiece.initializePiece();

    // frame frash
    Duration frameRate = Duration(milliseconds: 800);
    gameLoop(frameRate);
  }

  // Game Loop
  void gameLoop(Duration frameRate) {
    Timer.periodic(frameRate, (timer) {
      setState(() {
        checkLanding();
        currentPiece.movePiece(Direction.down);
      });
    });
  }

  // Check collision
  bool checkCollision(Direction direction) {
    for (int i = 0; i < currentPiece.position.length; i++) {
      // Calculate the row and col of the current position
      int row = (currentPiece.position[i] / Constants.rowLength).floor();
      int col = currentPiece.position[i] % Constants.rowLength;

      // adjust the row and col based on the direction
      if (direction == Direction.left) {
        col -= 1;
      } else if (direction == Direction.right) {
        col += 1;
      } else if (direction == Direction.down) {
        row += 1;
      }

      // checked if the piece is out of bounds
      if (row >= Constants.colLength || col < 0 || col >= Constants.rowLength) {
        return true;
      }
      if (row >= 0 && gameBoard[row][col] != null) {
        return true;
      }
    }
    // if no collisions are detected
    return false;
  }

  void checkLanding() {
    // if going down is occupied
    if (checkCollision(Direction.down)) {
      for (int i = 0; i < currentPiece.position.length; i++) {
        int row = (currentPiece.position[i] / Constants.rowLength).floor();
        int col = currentPiece.position[i] % Constants.rowLength;
        if (row >= 0 && col >= 0) {
          gameBoard[row][col] = currentPiece.type;
        }
      }

      // created next piece
      createdNewPiece();
    }
  }

  void createdNewPiece() {
    Random random = Random();

    Tetromino randomType =
        Tetromino.values[random.nextInt(Tetromino.values.length)];
    currentPiece = Piece(type: randomType);
    currentPiece.initializePiece();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
          itemCount: Constants.rowLength * Constants.colLength,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Constants.rowLength,
          ),
          itemBuilder: (context, index) {
            int row = (index / Constants.rowLength).floor();
            int col = (index % Constants.rowLength);

            if (currentPiece.position.contains(index)) {
              return Center(
                child: Pixel(
                  color: Colors.yellow,
                  child: index,
                ),
              );
            } else if(gameBoard[row][col] != null) {
              return Pixel(
                color: Colors.purple,
                child: '',
              );
            } else {
              return Center(
                child: Pixel(
                  color: Colors.grey[900],
                  child: index,
                ),
              );
            }
          }),
    );
  }
}
