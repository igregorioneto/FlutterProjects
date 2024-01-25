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
          4,
          14,
          24,
          25,
        ];
        break;
      default:
    }
  }

  void movePiece(Direction direction) {
    switch(direction) {
      case Direction.down:
        for (int i = 0; i < position.length; i++) {
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