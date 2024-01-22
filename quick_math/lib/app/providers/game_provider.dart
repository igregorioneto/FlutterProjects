import 'dart:math';

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:quick_math/app/models/level_model.dart';

class GameProvider extends ChangeNotifier {

  // List Levels
  List<LevelModel> _levels = [];

  final _operations = ['+', '-', '*', '/'];
  final random = Random();

  // Level actual
  int _actualLevel = 0;
  bool _gameFinish = false;

  // Gets
  List<LevelModel> get levels => _levels;
  int get actualLevel => _actualLevel;
  bool get gameFinish => _gameFinish;

  void finish() {
    _gameFinish = true;
  }

  // Next Level
  void nextLevel() {
    generatedLevel();
  }

  void generatedLevel() {
    _levels.clear();

    var n1 = random.nextInt(100);
    var n2 = random.nextInt(100);
    var operation = _operations[random.nextInt(_operations.length)];
    //var operation = _operations[0];
    var question = '${n1} ${operation} ${n2} = ?';

    num r = question.split("=")[0].trim().interpret();

    List<num> answers = [r, random.nextInt(200), random.nextInt(200), random.nextInt(200)];
    answers.shuffle();

    _levels.add(LevelModel(
      question: question,
      answers:answers,
    ));
  }

  bool gameWin() {
    if (_actualLevel >= _levels.length) {
      return true;
    }
    return false;
  }

  // Get Level Actual
  LevelModel getLevel() {
    if (!gameFinish && _actualLevel < _levels.length) {
      return _levels[_actualLevel];
    }

    return  LevelModel(
      question: "",
      answers: [0, 0, 0, 0],
    );
  }

  // Reloading Game
  void reloadingGame() {
    _actualLevel = 0;
    _gameFinish = false;
    generatedLevel();
  }
}
