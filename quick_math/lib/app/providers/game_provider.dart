import 'dart:math';

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:quick_math/app/models/level_model.dart';

class GameProvider extends ChangeNotifier {

  // List Levels
  List<LevelModel> _levels = [];

  // Operations and Random
  final _operations = ['+', '-', '*', '/'];
  final _random = Random();

  // Ranked Score
  int _rankedScore = 0;

  // Coin base
  int _coinBase = 0;

  // Score
  int _score = 0;
  int _scoreBase = 0;

  // Level actual
  int _actualLevel = 0;
  bool _gameFinish = false;

  // Gets
  List<LevelModel> get levels => _levels;
  int get actualLevel => _actualLevel;
  bool get gameFinish => _gameFinish;
  int get rankedScore => _rankedScore;
  int get coinBase => _coinBase;
  int get score => _score;
  int get scoreBase => _scoreBase;

  // Finish Game
  void finish() {
    _gameFinish = true;
  }

  // Starting Game
  void start() {
    _gameFinish = false;
  }

  // Next Level
  void nextLevel() {
    generatedLevel();
  }

  // Updating Ranked Score
  void updatingRankedScore(int score) {
    _rankedScore = score;
  }

  void updatingCoinBase(int score) {
    _coinBase += (score * 2);
  }

  void updatingScore() {
    _score++;
    _scoreBase++;
  }

  void resetScore() {
    _score = 0;
  }

  // Generating new level
  void generatedLevel() {
    _levels.clear();

    var n1 = _random.nextInt(50);
    var n2 = _random.nextInt(50);
    var operation = _operations[_random.nextInt(_operations.length)];
    var question = '${n1} ${operation} ${n2} = ?';

    num r = question.split("=")[0].trim().interpret();

    List<num> answers = [r, _random.nextInt(100), _random.nextInt(100), _random.nextInt(100)];
    answers.shuffle();

    _levels.add(LevelModel(
      question: question,
      answers:answers,
    ));
  }

  // Game Win - Will not be used
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
