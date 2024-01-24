import 'dart:math';

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:quick_math/app/models/level_model.dart';
import 'package:quick_math/app/util/shape_converter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // Geometric level
  bool _isGeometricLevel = false;
  final _geometric = ['q', 't', 'c'];

  // Gets
  List<LevelModel> get levels => _levels;

  int get actualLevel => _actualLevel;

  bool get gameFinish => _gameFinish;

  int get rankedScore => _rankedScore;

  int get coinBase => _coinBase;

  int get score => _score;

  int get scoreBase => _scoreBase;

  bool get isGeometricLevel => _isGeometricLevel;

  // Loading values in memory
  Future<void> loadValuesInMemory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _scoreBase = prefs.getInt('scoreBase') ?? 0;
    _rankedScore = prefs.getInt('rankedScore') ?? 0;
    _coinBase = prefs.getInt('coinBase') ?? 0;
    notifyListeners();
  }

  // Save Coin Base
  Future<void> saveCoinBase(int coinBase) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('coinBase', coinBase);

    _coinBase = coinBase;
    notifyListeners();
  }

  // Save Ranked Score
  Future<void> saveRankedScore(int rankedScore) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('rankedScore', rankedScore);

    _rankedScore = rankedScore;
    notifyListeners();
  }

  // Save Score Base
  Future<void> saveScoreBase(int scoreBase) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('scoreBase', scoreBase);

    _scoreBase = scoreBase;
    notifyListeners();
  }

  // Updating Values
  void updatingValues() {
    saveCoinBase(_coinBase);
    saveRankedScore(_rankedScore);
    saveScoreBase(_scoreBase);
  }

  // Finish Game
  void finish() {
    _scoreBase = _score;
    saveScoreBase(_scoreBase);
    _gameFinish = true;
    notifyListeners();
  }

  // Starting Game
  void start() {
    _gameFinish = false;
  }

  // Next Level
  void nextLevel() {
    generatedLevelGame();
  }

  // Updating Ranked Score
  void updatingRankedScore(int score) {
    _rankedScore = score;
    saveRankedScore(_rankedScore);
  }

  // Updating Coin Base
  void updatingCoinBase(int score) {
    _coinBase += (score * 2);
    saveCoinBase(_coinBase);
  }

  // Using Coin
  void usingCoinBase() {
    if (coinBase > 5) {
      _coinBase -= 5;
    }
  }

  // Updating Score
  void updatingScore() {
    _score++;
  }

  // Reset Score
  void resetScore() {
    _score = 0;
  }

  void generatedLevelGame() {
    if (_score % 5 == 0) {
      generatedLevelGeometricFigures();
    } else {
      generatedLevel();
    }
  }

  // Generating new level
  void generatedLevel() {
    _levels.clear();

    var n1 = _random.nextInt(50);
    var n2 = _random.nextInt(50);
    var operation = _operations[_random.nextInt(_operations.length)];
    var question = '${n1} ${operation} ${n2} = ?\n';

    List<Widget> questionWidget = ShapeConverter.replaceShapesInQuestion(question);

    num r = question.split("=")[0].trim().interpret();

    List<num> answers = [
      r,
      _random.nextInt(100),
      _random.nextInt(100),
      _random.nextInt(100)
    ];
    answers.shuffle();

    _levels.add(LevelModel(
      question: Column(mainAxisAlignment: MainAxisAlignment.center,children: questionWidget),
      questionResponse: question,
      answers: answers,
      special: false,
      response: r,
    ));
  }

  // Generated Level Geometric Figures
  void generatedLevelGeometricFigures() {
    _levels.clear();
    // Gerar as formas
    var shape1 = _geometric[_random.nextInt(_geometric.length)];
    var shape2 = _geometric[_random.nextInt(_geometric.length)];

    num value1 = getShapeValue(shape1);
    num value2 = getShapeValue(shape2);

    // Question 1
    var operation = _operations[_random.nextInt(_operations.length)];
    num result1 = calculateGeometricOperation(value1, value2, operation);
    var question1 = '${shape1} ${operation} ${shape2} = ${result1}';

    // Question 2
    operation = _operations[_random.nextInt(_operations.length)];
    num result2 = calculateGeometricOperation(value1, value2, operation);
    var question2 = '${shape1} ${operation} ${shape2} = ${result2}';

    // Question 3
    operation = _operations[_random.nextInt(_operations.length)];
    num result3 = calculateGeometricOperation(value1, value2, operation);
    var question3 = '${shape1} ${operation} ${shape2} = ?';

    List<num> answers = [
      result3,
      _random.nextInt(20),
      _random.nextInt(20),
      _random.nextInt(20)
    ];
    answers.shuffle();

    var question = '$question1\n$question2\n$question3';
    List<Widget> questionWidgets =
        ShapeConverter.replaceShapesInQuestion(question);

    _levels.add(
      LevelModel(
        question: Column(mainAxisAlignment: MainAxisAlignment.center,children: questionWidgets),
        questionResponse: question3,
        answers: answers,
        special: true,
        response: result3,
      ),
    );
  }

  // Calculate Operations
  num calculateGeometricOperation(num value1, num value2, String operation) {
    switch (operation) {
      case '+':
        return value1 + value2;
      case '-':
        return value1 - value2;
      case '*':
        return value1 * value2;
      case '/':
        return value1 / value2;
      default:
        throw Exception('Geometric operation not supported!');
    }
  }

  // Get value shape
  num getShapeValue(String shape) {
    switch (shape) {
      case 'q':
        return _random.nextInt(10);
      case 't':
        return _random.nextInt(15);
      case 'c':
        return _random.nextInt(20);
      default:
        throw Exception('Unrecognized Geometric Shape');
    }
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

    return LevelModel(
      question: Column(),
      questionResponse: '',
      answers: [0, 0, 0, 0],
      special: false,
      response: 0,
    );
  }

  // Reloading Game
  void reloadingGame() {
    _actualLevel = 0;
    _gameFinish = false;
    generatedLevelGame();
  }
}
