import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tetris_game/app/game/colors.dart';
import 'package:tetris_game/app/game/constants.dart';
import 'package:tetris_game/app/game/direction.dart';
import 'package:tetris_game/app/game/tetromino.dart';

class Piece {
  Tetromino type;

  Piece({required this.type});

  // Game Board
  static List<List<Tetromino?>> gameBoard = List.generate(
    Constants.colLength,
    (i) => List.generate(
      Constants.rowLength,
      (j) => null,
    ),
  );

  // the piece is just a list of integers
  List<int> position = [];

  // color of tetris piece
  Color get color {
    return tetrominoColors[type] ?? const Color(0xFFFFFFFF);
  }

  // Generate the integers
  void initializePiece() {
    switch (type) {
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
      case Tetromino.T:
        position = [
          -26,
          -16,
          -6,
          -15,
        ];
        break;
      default:
    }
  }

  // Move Piece
  void movePiece(Direction direction) {
    switch (direction) {
      case Direction.down:
        for (int i = 0; i < position.length; i++) {
          position[i] += Constants.rowLength;
        }
        break;
      case Direction.left:
        for (int i = 0; i < position.length; i++) {
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

  // Rotate Piece
  int rotationState = 1;

  void rotatePiece() {
    // new position
    List<int> newPosition = [];

    // rotate piece based in type
    switch (type) {
      case Tetromino.L:
        switch (rotationState) {
          case 0:
            newPosition = [
              position[1] - Constants.rowLength,
              position[1],
              position[1] + Constants.rowLength,
              position[1] + Constants.rowLength + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + Constants.rowLength - 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + Constants.rowLength,
              position[1],
              position[1] - Constants.rowLength,
              position[1] - Constants.rowLength - 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] - Constants.rowLength + 1,
              position[1],
              position[1] + 1,
              position[1] - 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          default:
        }
        break;
      case Tetromino.J:
        switch(rotationState) {
          case 0:
            newPosition = [
              position[1] - Constants.rowLength,
              position[1],
              position[1] + Constants.rowLength,
              position[1] + Constants.rowLength - 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] - Constants.rowLength - 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + Constants.rowLength,
              position[1],
              position[1] - Constants.rowLength,
              position[1] - Constants.rowLength + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] + 1,
              position[1],
              position[1] - 1,
              position[1] + Constants.rowLength + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          default:
        }
        break;
      case Tetromino.I:
        switch(rotationState) {
          case 0:
            newPosition = [
              position[1] - Constants.rowLength,
              position[1],
              position[1] + Constants.rowLength,
              position[1] + 2 * Constants.rowLength,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + 2,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] - Constants.rowLength,
              position[1],
              position[1] + Constants.rowLength,
              position[1] + 2 * Constants.rowLength,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + 2,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          default:
        }
        break;
      case Tetromino.O:
        break;
      case Tetromino.S:
        switch(rotationState) {
          case 0:
          case 2:
            newPosition = [
              position[1] - Constants.rowLength,
              position[1],
              position[1] + 1,
              position[1] + Constants.rowLength + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 1:
          case 3:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + Constants.rowLength,
              position[1] + Constants.rowLength + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          default:
        }
        break;
      case Tetromino.Z:
        switch(rotationState) {
          case 0:
          case 2:
            newPosition = [
              position[1] - Constants.rowLength - 1,
              position[1] - Constants.rowLength,
              position[1],
              position[1] + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 1:
          case 3:
            newPosition = [
              position[1] - Constants.rowLength + 1,
              position[1],
              position[1] + Constants.rowLength,
              position[1] + Constants.rowLength + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          default:
        }
        break;
      case Tetromino.T:
        switch(rotationState) {
          case 0:
            newPosition = [
              position[1] - Constants.rowLength,
              position[1],
              position[1] + 1,
              position[1] + Constants.rowLength,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + Constants.rowLength,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] - Constants.rowLength,
              position[1],
              position[1] + 1,
              position[1] + Constants.rowLength,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] - Constants.rowLength,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          default:
        }
        break;
      default:
    }
  }

  // checked if valid position
  bool positionIsValid(int position) {
    int row = (position / Constants.rowLength).floor();
    int col = position % Constants.rowLength;

    if (row < 0 || col < 0 || gameBoard[row][col] != null) {
      return false;
    } else {
      return true;
    }
  }

  // checked if piece is valid position
  bool piecePositionIsValid(List<int> piecePosition) {
    bool firstColOccupied = false;
    bool lastColOccupied = false;

    for (int pos in piecePosition) {
      // position taken return false
      if (!positionIsValid(pos)) {
        return false;
      }

      int col = pos % Constants.rowLength;
      if (col == 0) {
        firstColOccupied = true;
      }
      if (col == Constants.rowLength - 1) {
        lastColOccupied = true;
      }
    }

    return !(firstColOccupied && lastColOccupied);
  }
}
