import 'package:tetris_game/app/game/constants.dart';
import 'package:tetris_game/app/game/direction.dart';
import 'package:tetris_game/app/game/tetromino.dart';

class Piece {
  Tetromino type;

  Piece({required this.type});

  // the piece is just a list of integers
  List<int> position = [];

  // Generate the integers
  void initializePiece() {
    switch(type) {
      case Tetromino.L:
        position = [
          -4,
          -14,
          -24,
          -25,
        ];
        break;
      case Tetromino.J:
        position = [
          -25,
          -15,
          -5,
          -6,
        ];
        break;
      case Tetromino.I:
        position = [
          -4,
          -5,
          -6,
          -7,
        ];
        break;
      case Tetromino.O:
        position = [
          -15,
          -16,
          -5,
          -6,
        ];
        break;
      case Tetromino.S:
        position = [
          -15,
          -14,
          -6,
          -5,
        ];
        break;
      case Tetromino.Z:
        position = [
          -17,
          -16,
          -6,
          -5,
        ];
        break;
      default:
    }
  }

  void movePiece(Direction direction) {
    switch(direction) {
      case Direction.down:
        for (int i = 0; i < position.length; i++) {
          print(position[i]);
          position[i] += Constants.rowLength;
        }
        break;
      case Direction.left:
        for(int i = 0; i < position.length; i++) {
          position[i] -= 1;
        }
        break;
      case Direction.right:
        for (int i = 0; i < position.length; i++) {
          position[i] += 1;
        }
        break;
      default:
    }
  }
}