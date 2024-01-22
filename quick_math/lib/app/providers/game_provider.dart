import 'package:flutter/material.dart';
import 'package:quick_math/app/models/level_model.dart';

class GameProvider extends ChangeNotifier {

  // List Levels
  List<LevelModel> _levels = [
    LevelModel(
      question: "2 + 2 = ?",
      answers: [4, 5, 3, 2],
    ),
    LevelModel(
      question: "? + 2 = 3",
      answers: [-1, 1, 3, 5],
    ),
  ];

  // Level actual
  int _actualLevel = 1;

  // Gets
  List<LevelModel> get levels => _levels;
  int get actualLevel => _actualLevel;

  // Next Level
  void nextLevel() {
    if (_actualLevel < _levels.length) {
      _actualLevel++;
    }
  }

  // Get Level Actual
  LevelModel getLevel() {
    return _levels[_actualLevel];
  }
}
