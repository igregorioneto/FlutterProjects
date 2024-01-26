import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris_game/app/game/constants.dart';
import 'package:tetris_game/app/game/direction.dart';
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
  int currentScore = 0;

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
        // clear lines
        clearLines();
        // check landing
        checkLanding();
        // move current piece down
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
      // checked if the piece is collid with others piece
      if (row >= 0 && Piece.gameBoard[row][col] != null) {
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
          Piece.gameBoard[row][col] = currentPiece.type;
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

  // Game Controls
  void moveLeft() {
    if (!checkCollision(Direction.left)) {
      setState(() {
        currentPiece.movePiece(Direction.left);
      });
    }
  }

  void moveRight() {
    if (!checkCollision(Direction.right)) {
      setState(() {
        currentPiece.movePiece(Direction.right);
      });
    }
  }

  void rotatePiece() {
    setState(() {
      currentPiece.rotatePiece();
    });
  }

  // Clear lines
  void clearLines() {
    for (int row = Constants.colLength - 1; row >= 0; row--) {
      bool rowIsFull = true;
      for (int col = 0; col < Constants.rowLength; col++) {
        if (Piece.gameBoard[row][col] == null) {
          rowIsFull = false;
          break;
        }
      }

      if (rowIsFull) {
        for (int r = row; r > 0; r--) {
          Piece.gameBoard[r] = List.from(Piece.gameBoard[r - 1]);
        }
        Piece.gameBoard[0] = List.generate(row, (index) => null);
        currentScore++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Game Board
          Expanded(
            child: GridView.builder(
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
                      color: currentPiece.color,
                      child: index,
                    ),
                  );
                } else if (Piece.gameBoard[row][col] != null) {
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
              },
            ),
          ),

          Text(
            'Score: $currentScore',
            style: TextStyle(color: Colors.white),
          ),

          // Game Controls
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: moveLeft,
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back_ios),
                ),
                IconButton(
                  onPressed: rotatePiece,
                  color: Colors.white,
                  icon: Icon(Icons.rotate_right),
                ),
                IconButton(
                  onPressed: moveRight,
                  color: Colors.white,
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
